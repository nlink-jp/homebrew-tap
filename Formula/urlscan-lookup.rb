class UrlscanLookup < Formula
  desc "Investigate a suspicious URL via the urlscan.io API (CLI + MCP)"
  homepage "https://github.com/nlink-jp/urlscan-lookup"
  url "https://github.com/nlink-jp/urlscan-lookup/releases/download/v0.1.0/urlscan-lookup-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "5a05d7046629814ab665f4c2ab04b9f459f093c0443167a472f1422a317f8b29"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "urlscan-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/urlscan-lookup --version")
  end
end
