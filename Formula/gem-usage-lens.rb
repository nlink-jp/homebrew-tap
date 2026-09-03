class GemUsageLens < Formula
  desc "Token usage and cost analyzer for gem-agent session logs (Vertex AI Gemini)"
  homepage "https://github.com/nlink-jp/gem-usage-lens"
  url "https://github.com/nlink-jp/gem-usage-lens/releases/download/v0.1.2/gem-usage-lens-v0.1.2-darwin-arm64.zip"
  sha256 "3c6db49615cde1dd924b6b732765ed88862d465d56e0af94dc48eb92ec3312ea"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-usage-lens"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-usage-lens --version")
  end
end
