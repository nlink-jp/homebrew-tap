class AskLlmMcp < Formula
  desc "MCP server exposing ask_llm(prompt) for OpenAI-compatible endpoints"
  homepage "https://github.com/nlink-jp/ask-llm-mcp"
  url "https://github.com/nlink-jp/ask-llm-mcp/releases/download/v0.3.0/ask-llm-mcp-v0.3.0-darwin-arm64.zip"
  sha256 "0c4e39bc00c39a94a53f19d1e3916fded9537317dd5aecf39144fe796c4777cc"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ask-llm-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/ask-llm-mcp --version")
  end
end
