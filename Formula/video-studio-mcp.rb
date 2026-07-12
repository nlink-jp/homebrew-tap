class VideoStudioMcp < Formula
  desc "MCP server compositing page images and audio into a narrated MP4"
  homepage "https://github.com/nlink-jp/video-studio-mcp"
  url "https://github.com/nlink-jp/video-studio-mcp/releases/download/v0.3.0/video-studio-mcp-v0.3.0-darwin-arm64.zip"
  version "0.3.0"
  sha256 "8f14bec5ec78b1cd082c369a4cc6ef6be3620ea7c65c4889f485ac2c32065ac4"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "video-studio-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/video-studio-mcp --version")
  end
end
