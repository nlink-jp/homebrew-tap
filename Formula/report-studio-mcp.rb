class ReportStudioMcp < Formula
  desc "MCP server that typesets Markdown reports into PDF and Word documents"
  homepage "https://github.com/nlink-jp/report-studio-mcp"
  url "https://github.com/nlink-jp/report-studio-mcp/releases/download/v0.2.0/report-studio-mcp-v0.2.0-darwin-arm64.zip"
  sha256 "b7d9aa4cc83e66ec75e0e29f0ca700783324616a5cc44c30b3d6fc6855e9c1ea"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "report-studio-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/report-studio-mcp --version")
  end
end
