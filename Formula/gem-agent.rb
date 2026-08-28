class GemAgent < Formula
  desc "Interactive CLI agent on Vertex AI Gemini (Claude Code fallback)"
  homepage "https://github.com/nlink-jp/gem-agent"
  url "https://github.com/nlink-jp/gem-agent/releases/download/v0.53.0/gem-agent-v0.53.0-darwin-arm64.zip"
  sha256 "3c03caf5ed94335c88bc6fa7cff3f1abc53d7216e72173860c6923daa391f2a6"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-agent"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-agent --version")
  end
end
