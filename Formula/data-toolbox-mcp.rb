class DataToolboxMcp < Formula
  desc "MCP server for DuckDB analysis and sandboxed Python execution"
  homepage "https://github.com/nlink-jp/data-toolbox-mcp"
  url "https://github.com/nlink-jp/data-toolbox-mcp/releases/download/v0.9.0/data-toolbox-mcp-v0.9.0-darwin-arm64.zip"
  sha256 "720b10873237058b88bb45e29477afde3d1a50159749e004b68a86a6cd89a336"
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
