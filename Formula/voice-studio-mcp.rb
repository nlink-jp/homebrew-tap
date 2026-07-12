class VoiceStudioMcp < Formula
  desc "Multi-speaker Japanese speech-synthesis MCP server"
  homepage "https://github.com/nlink-jp/voice-studio-mcp"
  url "https://github.com/nlink-jp/voice-studio-mcp/releases/download/v0.4.4/voice-studio-mcp-v0.4.4-darwin-arm64.zip"
  version "0.4.4"
  sha256 "ce559913be6fd3fc805bbfb073f267790131ab200b8255ef2e9983a9bcc9f01e"
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
