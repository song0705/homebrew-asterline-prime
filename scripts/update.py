#!/usr/bin/env python3
"""Pin the latest public Prime release source and verify its crate version."""
import hashlib
import io
import json
from pathlib import Path
import re
import tarfile
import tomllib
import urllib.request

REPO = "song0705/Asterline-Prime"

def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": "asterline-prime-tap"})
    with urllib.request.urlopen(request, timeout=120) as response:
        return response.read()

release = json.loads(fetch(f"https://api.github.com/repos/{REPO}/releases/latest"))
tag = release["tag_name"]
if not re.fullmatch(r"(?:prime-)?v[0-9]+\.[0-9]+\.[0-9]+", tag):
    raise SystemExit(f"Unsupported stable release tag: {tag}")
url = f"https://github.com/{REPO}/archive/refs/tags/{tag}.tar.gz"
archive = fetch(url)
with tarfile.open(fileobj=io.BytesIO(archive), mode="r:gz") as tar:
    manifests = [m for m in tar.getmembers() if m.name.count("/") == 1 and m.name.endswith("/Cargo.toml")]
    if len(manifests) != 1:
        raise SystemExit("Expected one root Cargo.toml")
    version = tomllib.loads(tar.extractfile(manifests[0]).read().decode())["package"]["version"]
if tag.removeprefix("prime-") != f"v{version}":
    raise SystemExit("Release tag and crate version differ")
checksum = hashlib.sha256(archive).hexdigest()
formula = f'''class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/{REPO}"
  url "{url}"
  version "{version}"
  sha256 "{checksum}"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--locked", "--release", "--bins"
    bin.install "target/release/asterline", "target/release/ast"
    doc.install "LICENSE"
  end

  test do
    assert_match "Usage: asterline", shell_output("#{{bin}}/asterline --help")
    assert_match "Usage: asterline", shell_output("#{{bin}}/ast --help")
  end
end
'''
# Ruby interpolation must survive the Python f-string above.
Path(__file__).resolve().parents[1].joinpath("Formula/asterline.rb").write_text(formula)
print(f"Pinned {tag}: {checksum}")
