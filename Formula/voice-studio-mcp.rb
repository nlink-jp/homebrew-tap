class VoiceStudioMcp < Formula
  desc "Multi-speaker Japanese speech-synthesis MCP server"
  homepage "https://github.com/nlink-jp/voice-studio-mcp"
  url "https://github.com/nlink-jp/voice-studio-mcp/releases/download/v0.4.5/voice-studio-mcp-v0.4.5-darwin-arm64.zip"
  sha256 "b4955c24e286744cb539bb0aa828a34dbcbb4d9607485586fc57a5e3c96000b4"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "voice-studio-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/voice-studio-mcp --version")
  end
end
