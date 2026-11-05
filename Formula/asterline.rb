class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  version "1.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.10/asterline-aarch64-apple-darwin.tar.gz"
      sha256 "29eed8b558e5201648cf8fbecd98af6cd8fff6b49843ffccf9e7f4c29723ac0c"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.10/asterline-x86_64-apple-darwin.tar.gz"
      sha256 "345d298a1957e9c3fdb8bfb4273d6aa0ba17878c23b2b4d46b58fe1872a8581c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.10/asterline-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31b4f4a72d41c3f5be2d3e4558558dda174a358bf56b63acda3fcfc37f90be50"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.10/asterline-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6d08b6025781460393d22c351782b9878468dd9d10902e20a1f9e9f8177f509"
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
