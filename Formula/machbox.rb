class Machbox < Formula
  desc "Lightweight macOS malware analysis sandbox"
  homepage "https://github.com/ac0d3r/machbox"
  url "https://github.com/ac0d3r/machbox/releases/download/v0.1.3/machbox-darwin-arm64"
  sha256 "f8cf384a4062c7d7af9873068cf48e82f88a7c5c8dcb9e436db0b9beff4787b2"
  version "0.1.3"
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
