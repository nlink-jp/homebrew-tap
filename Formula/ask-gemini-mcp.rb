class AskGeminiMcp < Formula
  desc "MCP server exposing ask_gemini(prompt) backed by Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/ask-gemini-mcp"
  url "https://github.com/nlink-jp/ask-gemini-mcp/releases/download/v0.2.1/ask-gemini-mcp-v0.2.1-darwin-arm64.zip"
  sha256 "baeca5be5b433bf3141abc0f7b75a5fe8dd7b277fdbcc966fd9cacf96906baa0"
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
