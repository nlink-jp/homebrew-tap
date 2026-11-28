class VideoStudioMcp < Formula
  desc "MCP server compositing page images and audio into a narrated MP4"
  homepage "https://github.com/nlink-jp/video-studio-mcp"
  url "https://github.com/nlink-jp/video-studio-mcp/releases/download/v0.8.0/video-studio-mcp-v0.8.0-darwin-arm64.zip"
  sha256 "c9854e3a419dc9e9d274073a08616f1e92d3c4f19f3d5822a9d3ce9807056cc8"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "video-studio-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/video-studio-mcp --version")
  end
end
