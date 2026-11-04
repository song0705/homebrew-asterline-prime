class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  url "https://github.com/song0705/Asterline-Prime/archive/refs/tags/prime-v1.0.5.tar.gz"
  version "1.0.5"
  sha256 "0b92754ac6029fae5a029878ec28bbcd4d33b60527b3b115d29b877b36924a9b"
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
