class AskLlmMcp < Formula
  desc "MCP server exposing ask_llm(prompt) for OpenAI-compatible endpoints"
  homepage "https://github.com/nlink-jp/ask-llm-mcp"
  url "https://github.com/nlink-jp/ask-llm-mcp/releases/download/v0.2.0/ask-llm-mcp-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "2a655ac2f937851b31b0897e2b39d694bdfbb2a37cc7c17eaf31c8c7d452e83d"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ask-llm-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ask-llm-mcp --version")
  end
end
