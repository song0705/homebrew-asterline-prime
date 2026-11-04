class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.7/asterline-aarch64-apple-darwin.tar.gz"
      sha256 "7f4afc0f0a71034ddea613393a7efcc1acfd1bc2b4b4da050a5960ba22694044"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.7/asterline-x86_64-apple-darwin.tar.gz"
      sha256 "bd7476bbae1d4a9ba81a1f3d7545fef2b1866dfa6e5221c98804a63b23df4c28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.7/asterline-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8de74cb3d318fa1df87bb3a71fa0f79e166cacfd0b056faacc50674b3f1af1d"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.7/asterline-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6748fa9d9fad2c3ad9229fb4671c390d1377b78afd01054cbfc9fae3dc786d3d"
    end
  end

  def install
    bin.install "asterline", "ast"
    doc.install "LICENSE"
  end

  test do
    assert_match "Usage: asterline", shell_output("#{bin}/asterline --help")
    assert_match "Usage: asterline", shell_output("#{bin}/ast --help")
  end
end
