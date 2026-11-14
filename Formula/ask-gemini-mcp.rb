class AskGeminiMcp < Formula
  desc "MCP server exposing ask_gemini(prompt) backed by Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/ask-gemini-mcp"
  url "https://github.com/nlink-jp/ask-gemini-mcp/releases/download/v0.2.3/ask-gemini-mcp-v0.2.3-darwin-arm64.zip"
  sha256 "86cb9481dbd1f32f5a82c0015c5b7873100f23f025b45961e4c824175fd9353d"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ask-gemini-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/ask-gemini-mcp --version")
  end
end
