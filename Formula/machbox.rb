class Machbox < Formula
  desc "Lightweight macOS malware analysis sandbox"
  homepage "https://github.com/ac0d3r/machbox"
  url "https://github.com/ac0d3r/machbox/releases/download/v0.2.0/machbox-darwin-arm64"
  sha256 "024d6290e3653317832ff1b2b4072949d039edad51e671fb6f41b23d04566acd"
  version "0.2.0"
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
