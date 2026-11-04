class SplunkMcp < Formula
  desc "MCP server for Splunk search with exact result counts over the REST API"
  homepage "https://github.com/nlink-jp/splunk-mcp"
  url "https://github.com/nlink-jp/splunk-mcp/releases/download/v0.4.0/splunk-mcp-v0.4.0-darwin-arm64.zip"
  sha256 "61020916c7cf4ba4e28c2caf982f8ccaff0849abc4bd56cb61f5b82cf7789081"
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
