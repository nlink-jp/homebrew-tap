class SplunkMcp < Formula
  desc "MCP server for Splunk search with exact result counts over the REST API"
  homepage "https://github.com/nlink-jp/splunk-mcp"
  url "https://github.com/nlink-jp/splunk-mcp/releases/download/v0.2.2/splunk-mcp-v0.2.2-darwin-arm64.zip"
  sha256 "9d9674dc03e5b272695e0c68f5e1d79783714fc83887b81b19981eefe996dded"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "splunk-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-mcp --version")
  end
end
