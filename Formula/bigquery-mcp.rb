class BigqueryMcp < Formula
  desc "Protection-first BigQuery MCP server with a dry-run budget gate and structured errors"
  homepage "https://github.com/nlink-jp/bigquery-mcp"
  url "https://github.com/nlink-jp/bigquery-mcp/releases/download/v0.1.2/bigquery-mcp-v0.1.2-darwin-arm64.zip"
  sha256 "c98f61383c28a8dc1b7b9f32190b33f18d2c667a3c2101c5fea2d15cc6821f53"
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
