class AsnLookup < Formula
  desc "Local IP-to-ASN and ASN-to-prefix lookups from the IPinfo Lite database"
  homepage "https://github.com/nlink-jp/asn-lookup"
  url "https://github.com/nlink-jp/asn-lookup/releases/download/v0.1.0/asn-lookup-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "2cf71479c373e1cbc8762cf47ed3a25213aa0fe851849c7a59389be93213213f"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "asn-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asn-lookup --version")
  end
end
