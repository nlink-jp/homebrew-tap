class VideoStudioMcp < Formula
  desc "MCP server compositing page images and audio into a narrated MP4"
  homepage "https://github.com/nlink-jp/video-studio-mcp"
  url "https://github.com/nlink-jp/video-studio-mcp/releases/download/v0.4.0/video-studio-mcp-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "51ad564a42009fd9a6f01770e55545ae76966a996698bccacc0a5152d854cfb3"
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
