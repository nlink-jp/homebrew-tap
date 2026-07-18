class DohLookup < Formula
  desc "Collect a domain's DNS records over DoH (out-of-band, distinguishable)"
  homepage "https://github.com/nlink-jp/doh-lookup"
  url "https://github.com/nlink-jp/doh-lookup/releases/download/v0.1.1/doh-lookup-v0.1.1-darwin-arm64.zip"
  version "0.1.1"
  sha256 "c59975794937f5283f43d32a32bcdf67866e105008f9a79b53672e39a9d3da59"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "doh-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doh-lookup --version")
  end
end
