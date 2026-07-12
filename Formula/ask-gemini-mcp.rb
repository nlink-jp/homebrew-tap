class AskGeminiMcp < Formula
  desc "MCP server exposing ask_gemini(prompt) backed by Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/ask-gemini-mcp"
  url "https://github.com/nlink-jp/ask-gemini-mcp/releases/download/v0.2.0/ask-gemini-mcp-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "19aed713cc48ec4f1171abdda8a90d1f14ba68824a3646af456e5ebf7268d9a0"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ask-gemini-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ask-gemini-mcp --version")
  end
end
