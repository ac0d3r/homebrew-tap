class Machbox < Formula
  desc "Lightweight macOS malware analysis sandbox"
  homepage "https://github.com/ac0d3r/machbox"
  url "https://github.com/ac0d3r/machbox/releases/download/v0.1.5/machbox-darwin-arm64"
  sha256 "ee657e46d358d0611bec1ba42a39f1861c0877905c4529ac0469bfcc7d934191"
  version "0.1.5"
  license "Apache-2.0"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "machbox-darwin-arm64" => "machbox"
  end

  def caveats
    <<~EOS
      The binary is ad-hoc signed. If Gatekeeper blocks it:

        xattr -d com.apple.quarantine #{bin}/machbox
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/machbox --version")
  end
end
