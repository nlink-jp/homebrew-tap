class SlackMcpExtender < Formula
  desc "Transparent proxy for the official Slack MCP with file-attachment upload tools"
  homepage "https://github.com/nlink-jp/slack-mcp-extender"
  url "https://github.com/nlink-jp/slack-mcp-extender/releases/download/v0.1.0/slack-mcp-extender-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "a5d33fd6d744198b0a57c871d6dafc7954fc3e6bbf736e8ffe741965d28d7ccf"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "slack-mcp-extender"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slack-mcp-extender --version")
  end
end
