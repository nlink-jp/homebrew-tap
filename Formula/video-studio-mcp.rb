class VideoStudioMcp < Formula
  desc "MCP server compositing page images and audio into a narrated MP4"
  homepage "https://github.com/nlink-jp/video-studio-mcp"
  url "https://github.com/nlink-jp/video-studio-mcp/releases/download/v0.5.4/video-studio-mcp-v0.5.4-darwin-arm64.zip"
  sha256 "b6005c8d3ef15e6f78bbed978aa9495cf777d0ff5a524a7e9e3388559472aade"
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
