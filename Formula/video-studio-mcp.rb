class VideoStudioMcp < Formula
  desc "MCP server compositing page images and audio into a narrated MP4"
  homepage "https://github.com/nlink-jp/video-studio-mcp"
  url "https://github.com/nlink-jp/video-studio-mcp/releases/download/v0.4.1/video-studio-mcp-v0.4.1-darwin-arm64.zip"
  version "0.4.1"
  sha256 "8139ce950ae890d2495bac5bc156999206af0865d7cbbfb9faa5886e86e04d19"
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
