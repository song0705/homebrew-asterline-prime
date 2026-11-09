class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  version "1.0.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.13/asterline-aarch64-apple-darwin.tar.gz"
      sha256 "b615e8afd57c51de9196a0cfb8b6d51fadd58ea3e880d3c7ead09342844f79a3"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.13/asterline-x86_64-apple-darwin.tar.gz"
      sha256 "9a5f57dd000881d7abda92cb5e70d550ab8fbc5d6b7d904dffbb48ff9cc29bed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.13/asterline-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1bd247132fe56b2aa1918fd778d842aee550157d31d2b677c6949a07c37d7e37"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.13/asterline-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcd442474d6d842a267303e23262e354e9283d2bad08e2b4974883c82302410c"
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
