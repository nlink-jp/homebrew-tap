class VoiceStudioMcp < Formula
  desc "Multi-speaker Japanese speech-synthesis MCP server"
  homepage "https://github.com/nlink-jp/voice-studio-mcp"
  url "https://github.com/nlink-jp/voice-studio-mcp/releases/download/v0.5.1/voice-studio-mcp-v0.5.1-darwin-arm64.zip"
  sha256 "6562cc85d60fb9a4f5845417feb1b840612dab9234d3abd98432ef3ef0e9cc53"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "voice-studio-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/voice-studio-mcp --version")
  end
end
