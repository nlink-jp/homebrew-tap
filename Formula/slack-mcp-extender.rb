class SlackMcpExtender < Formula
  desc "Transparent proxy for the official Slack MCP with file-attachment upload tools"
  homepage "https://github.com/nlink-jp/slack-mcp-extender"
  url "https://github.com/nlink-jp/slack-mcp-extender/releases/download/v0.3.1/slack-mcp-extender-v0.3.1-darwin-arm64.zip"
  sha256 "b30aeb557920bb998974666e868492fca1c01a15867a869760922be424dcaad0"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "slack-mcp-extender"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/slack-mcp-extender --version")
  end
end
