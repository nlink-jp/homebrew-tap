class McpGuardian < Formula
  desc "Zero-dependency MCP governance proxy"
  homepage "https://github.com/nlink-jp/mcp-guardian"
  url "https://github.com/nlink-jp/mcp-guardian/releases/download/v0.9.0/mcp-guardian-v0.9.0-darwin-arm64.zip"
  version "0.9.0"
  sha256 "5d527b5ed15bfce719a94263eb13df5d01a5e05f37db2203f37d3339752befce"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mcp-guardian"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-guardian --version")
  end
end
