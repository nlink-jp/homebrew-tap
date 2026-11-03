class ChromePilotMcp < Formula
  desc "Chrome automation MCP server with no third-party dependencies (CDP direct)"
  homepage "https://github.com/nlink-jp/chrome-pilot-mcp"
  url "https://github.com/nlink-jp/chrome-pilot-mcp/releases/download/v0.10.2/chrome-pilot-mcp-v0.10.2-darwin-arm64.zip"
  sha256 "2b6eb818137d8d5cfa66b841cde45d268486aea9693a3f0d4267a622b7b75d64"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "chrome-pilot-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/chrome-pilot-mcp --version")
  end
end
