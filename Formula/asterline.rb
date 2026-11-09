class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  version "1.0.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.12/asterline-aarch64-apple-darwin.tar.gz"
      sha256 "f360f11bb3ca57413205451ceb5ed407641d393ae13d5e2c80ca7ea05828d50d"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.12/asterline-x86_64-apple-darwin.tar.gz"
      sha256 "957e7f22275e4fa0201eea7e48f6b512b91feb355e222c861344b1584bf3caf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.12/asterline-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7af6830230301240cc5e6b60e67b2063bfcb66247d9b3d1a890b5d5e662d8c2e"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.12/asterline-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d6361181cc74a9bd83634c868ebd2ac97d5ceef73d5d2820e4f9517ec30d1be"
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
