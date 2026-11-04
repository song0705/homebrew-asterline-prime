class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  url "https://github.com/song0705/Asterline-Prime/archive/refs/tags/prime-v1.0.4.tar.gz"
  version "1.0.4"
  sha256 "fc13a3bf3dc69c95ef32c0c1ea1d8d2ff2a375096aab6d66f5335807cafc5c7f"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--locked", "--release", "--bins"
    bin.install "target/release/asterline", "target/release/ast"
    doc.install "LICENSE"
  end

  test do
    assert_match "Usage: asterline", shell_output("#{bin}/asterline --help")
    assert_match "Usage: asterline", shell_output("#{bin}/ast --help")
  end
end
