class BigqueryMcp < Formula
  desc "Protection-first BigQuery MCP server with a dry-run budget gate and structured errors"
  homepage "https://github.com/nlink-jp/bigquery-mcp"
  url "https://github.com/nlink-jp/bigquery-mcp/releases/download/v0.1.0/bigquery-mcp-v0.1.0-darwin-arm64.zip"
  sha256 "42fa016f00346abc17ebfd234dd275b80370a59aef4667b6c77528e82ff764a0"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bigquery-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/bigquery-mcp --version")
  end
end
