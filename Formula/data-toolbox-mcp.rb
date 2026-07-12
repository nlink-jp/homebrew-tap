class DataToolboxMcp < Formula
  desc "MCP server for DuckDB analysis and sandboxed Python execution"
  homepage "https://github.com/nlink-jp/data-toolbox-mcp"
  url "https://github.com/nlink-jp/data-toolbox-mcp/releases/download/v0.5.0/data-toolbox-mcp-v0.5.0-darwin-arm64.zip"
  version "0.5.0"
  sha256 "d9912417a6b240714d876f9dfdad1ce8ff39c73f70ee8fa12cf3b36990cadfd2"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "data-toolbox-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/data-toolbox-mcp --version")
  end
end
