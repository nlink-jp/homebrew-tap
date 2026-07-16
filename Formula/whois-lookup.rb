class WhoisLookup < Formula
  desc "Look up domain/IP/ASN registration data via RDAP with WHOIS fallback"
  homepage "https://github.com/nlink-jp/whois-lookup"
  url "https://github.com/nlink-jp/whois-lookup/releases/download/v0.1.0/whois-lookup-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "8148c75d807a7708426dc27f2b7b02eabe691ba95b8ed2700aa17480a1ae4a67"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "whois-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whois-lookup --version")
  end
end
