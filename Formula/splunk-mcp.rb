class SplunkMcp < Formula
  desc "MCP server for Splunk search with exact result counts over the REST API"
  homepage "https://github.com/nlink-jp/splunk-mcp"
  url "https://github.com/nlink-jp/splunk-mcp/releases/download/v0.1.0/splunk-mcp-v0.1.0-darwin-arm64.zip"
  sha256 "24cff05d851e7b7faad3ab879d38c551a12dcfaa02d1d4452d904b863471c7de"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "splunk-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-mcp --version")
  end
end
