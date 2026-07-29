class ChromePilotMcp < Formula
  desc "Zero-dependency Chrome automation MCP server (CDP direct)"
  homepage "https://github.com/nlink-jp/chrome-pilot-mcp"
  url "https://github.com/nlink-jp/chrome-pilot-mcp/releases/download/v0.1.0/chrome-pilot-mcp-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "708f2eefb4c5a312188c61d187d50484d0708a63c446e4de937853c7d1d858ae"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "chrome-pilot-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chrome-pilot-mcp --version")
  end
end
