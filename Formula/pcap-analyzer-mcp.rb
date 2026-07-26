class PcapAnalyzerMcp < Formula
  desc "MCP server for pcap/pcapng analysis via a containerized, version-pinned tshark"
  homepage "https://github.com/nlink-jp/pcap-analyzer-mcp"
  url "https://github.com/nlink-jp/pcap-analyzer-mcp/releases/download/v0.1.2/pcap-analyzer-mcp-v0.1.2-darwin-arm64.zip"
  version "0.1.2"
  sha256 "641bc4b569fcc8f8f9be5f3ac898de494bf0d8d5522389e551b94d6e4bb52908"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "pcap-analyzer-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pcap-analyzer-mcp --version")
  end
end
