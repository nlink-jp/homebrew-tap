class VoiceStudioMcp < Formula
  desc "Multi-speaker Japanese speech-synthesis MCP server"
  homepage "https://github.com/nlink-jp/voice-studio-mcp"
  url "https://github.com/nlink-jp/voice-studio-mcp/releases/download/v0.5.3/voice-studio-mcp-v0.5.3-darwin-arm64.zip"
  sha256 "fb2e0772100ab1c18204d8158695c34342b79e334cfe9fe8900d7734f0d8cdc1"
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
