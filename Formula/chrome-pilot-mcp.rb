class ChromePilotMcp < Formula
  desc "Chrome automation MCP server with no third-party dependencies (CDP direct)"
  homepage "https://github.com/nlink-jp/chrome-pilot-mcp"
  url "https://github.com/nlink-jp/chrome-pilot-mcp/releases/download/v0.10.0/chrome-pilot-mcp-v0.10.0-darwin-arm64.zip"
  sha256 "906aec3764114eaa5d866188902a31ebb6780518ffda6ef8b899e142605c12a2"
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
