class DataToolboxMcp < Formula
  desc "MCP server for DuckDB analysis and sandboxed Python execution"
  homepage "https://github.com/nlink-jp/data-toolbox-mcp"
  url "https://github.com/nlink-jp/data-toolbox-mcp/releases/download/v0.6.1/data-toolbox-mcp-v0.6.1-darwin-arm64.zip"
  sha256 "86309f012f0e184cf20eb6b0dd5f594c577d7f8fd59e0005930bc651f7c5f1d9"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "data-toolbox-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/data-toolbox-mcp --version")
  end
end
