class McpBridge < Formula
  desc "Bridge stdio MCP clients to HTTP servers needing a pre-registered OAuth client"
  homepage "https://github.com/nlink-jp/mcp-bridge"
  url "https://github.com/nlink-jp/mcp-bridge/releases/download/v0.4.0/mcp-bridge-v0.4.0-darwin-arm64.zip"
  sha256 "7903427f9d68604101ee0b13252d742943e22f588dead6c4497a391e428b8a08"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mcp-bridge"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-bridge --version")
  end
end
