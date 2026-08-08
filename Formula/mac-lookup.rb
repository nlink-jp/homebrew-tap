class MacLookup < Formula
  desc "Resolve a MAC address or BSSID to its vendor and address type (offline)"
  homepage "https://github.com/nlink-jp/mac-lookup"
  url "https://github.com/nlink-jp/mac-lookup/releases/download/v0.1.0/mac-lookup-v0.1.0-darwin-arm64.zip"
  sha256 "5b4b3b406f70530f663dff729fbca09db6805a33d47b27823629e3aa1b3746a1"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mac-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mac-lookup --version")
  end
end
