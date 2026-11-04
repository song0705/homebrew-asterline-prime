#!/usr/bin/env python3
"""Verify and pin the latest complete Prime portable release."""
import hashlib
import json
from pathlib import Path
import re
import urllib.request

REPO = "song0705/Asterline-Prime"
TARGETS = {
    "macos": {"arm": "aarch64-apple-darwin", "intel": "x86_64-apple-darwin"},
    "linux": {"arm": "aarch64-unknown-linux-gnu", "intel": "x86_64-unknown-linux-gnu"},
}


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": "asterline-prime-tap"})
    with urllib.request.urlopen(request, timeout=120) as response:
        return response.read()


release = json.loads(fetch(f"https://api.github.com/repos/{REPO}/releases/latest"))
tag = release["tag_name"]
if not re.fullmatch(r"prime-v[0-9]+\.[0-9]+\.[0-9]+", tag):
    raise SystemExit(f"Unsupported portable release tag: {tag}")
version = tag.removeprefix("prime-v")
base_url = f"https://github.com/{REPO}/releases/download/{tag}"
expected = {f"asterline-{target}.tar.gz" for arches in TARGETS.values() for target in arches.values()}
available = {asset["name"] for asset in release["assets"]}
if not expected.union({"PORTABLE-SHA256SUMS"}).issubset(available):
    print(f"{tag}: portable assets are not complete yet; keeping the installed formula")
    raise SystemExit(0)
checksums = {}
for line in fetch(f"{base_url}/PORTABLE-SHA256SUMS").decode().splitlines():
    checksum, filename = line.split()
    if not re.fullmatch(r"[0-9a-f]{64}", checksum) or filename in checksums:
        raise SystemExit("Invalid or duplicate checksum")
    checksums[filename] = checksum
if set(checksums) != expected:
    raise SystemExit("Checksum manifest does not match the four portable archives")
for filename in sorted(expected):
    if hashlib.sha256(fetch(f"{base_url}/{filename}")).hexdigest() != checksums[filename]:
        raise SystemExit(f"Checksum mismatch: {filename}")
lines = [
    'class Asterline < Formula',
    '  desc "Local-first terminal workspace for coding agent teams (Prime edition)"',
    f'  homepage "https://github.com/{REPO}"',
    f'  version "{version}"',
    '  license "MIT"',
]
for platform, arches in TARGETS.items():
    lines += ['', f'  on_{platform} do']
    for arch, target in arches.items():
        filename = f"asterline-{target}.tar.gz"
        lines += [f'    on_{arch} do', f'      url "{base_url}/{filename}"',
                  f'      sha256 "{checksums[filename]}"', '    end', '']
    lines[-1] = '  end'
lines += ['', '  def install', '    bin.install "asterline", "ast"',
          '    doc.install "LICENSE"', '  end', '', '  test do',
          '    assert_match "Usage: asterline", shell_output("#{bin}/asterline --help")',
          '    assert_match "Usage: asterline", shell_output("#{bin}/ast --help")',
          '  end', 'end', '']
Path(__file__).resolve().parents[1].joinpath("Formula/asterline.rb").write_text('\n'.join(lines))
print(f"Verified and pinned four portable archives for {tag}")
