class PcapAnalyzerMcp < Formula
  desc "MCP server for pcap/pcapng analysis via a containerized, version-pinned tshark"
  homepage "https://github.com/nlink-jp/pcap-analyzer-mcp"
  url "https://github.com/nlink-jp/pcap-analyzer-mcp/releases/download/v0.4.0/pcap-analyzer-mcp-v0.4.0-darwin-arm64.zip"
  sha256 "f4c5d90f415cd204e3b4e2207ae916d29cde04f98c035c4ada8b38d4391d16ee"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "pcap-analyzer-mcp"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/pcap-analyzer-mcp --version")
  end
end
