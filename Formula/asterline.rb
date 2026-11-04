class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.6/asterline-aarch64-apple-darwin.tar.gz"
      sha256 "0f0176c49f8724a4717cf9c52a0d355b54d2784ad3be5282713daae94e59de96"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.6/asterline-x86_64-apple-darwin.tar.gz"
      sha256 "c8f2f89c134f313a9834d778d6e46311f359fead15b0216123a45bf253d2ce69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.6/asterline-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34bcdd3606e86e3167b25af5ca2fce908e972f1ca0eaee8fb10b53bbf949a8fd"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.6/asterline-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e08df075b6d73e2dae808020ff7ee1422a1e22ae576b5d539d4092d94abeecf"
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
