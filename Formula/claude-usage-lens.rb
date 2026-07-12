class ClaudeUsageLens < Formula
  desc "Token usage and cost analyzer for Claude Code and Cowork logs"
  homepage "https://github.com/nlink-jp/claude-usage-lens"
  url "https://github.com/nlink-jp/claude-usage-lens/releases/download/v0.4.0/claude-usage-lens-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "d55844ab1a956ef33cd5b77a537256015a914b4fab9a0ac2277f8be0afe72caf"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "claude-usage-lens"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-usage-lens --version")
  end
end
