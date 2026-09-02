class ClaudeUsageLens < Formula
  desc "Token usage and cost analyzer for Claude Code and Cowork logs"
  homepage "https://github.com/nlink-jp/claude-usage-lens"
  url "https://github.com/nlink-jp/claude-usage-lens/releases/download/v0.7.0/claude-usage-lens-v0.7.0-darwin-arm64.zip"
  sha256 "d6f9231d0bdb8933f642f38213fd418f759f791a6597eeb2ed1adb52af43ac12"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "claude-usage-lens"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/claude-usage-lens --version")
  end
end
