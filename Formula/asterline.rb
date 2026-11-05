class Asterline < Formula
  desc "Local-first terminal workspace for coding agent teams (Prime edition)"
  homepage "https://github.com/song0705/Asterline-Prime"
  version "1.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.11/asterline-aarch64-apple-darwin.tar.gz"
      sha256 "62c34245caaab5c0b8c2f860965c6896ecad8f0abbf76a609d408b64499d3635"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.11/asterline-x86_64-apple-darwin.tar.gz"
      sha256 "0bb925ff75801c5139ab6a3be1f240344d9f600aca0de08329eb3b01371071f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.11/asterline-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c93ffdf76d3ff8fe48f44b5ea0f1cfa582455378efda76029a2876977e37080f"
    end

    on_intel do
      url "https://github.com/song0705/Asterline-Prime/releases/download/prime-v1.0.11/asterline-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40a3d227eee1ec7f1fe5c64729c95c3f07fa471c12515c5238aae48992ebe66b"
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
