class Machbox < Formula
  desc "Lightweight macOS malware analysis sandbox"
  homepage "https://github.com/ac0d3r/machbox"
  url "https://github.com/ac0d3r/machbox/releases/download/v0.1.2/machbox-darwin-arm64"
  sha256 "23df7943d34859a1ea5d74b6121e4945a2280b226c36ada49ef425017dc993fb"
  version "0.1.2"
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
