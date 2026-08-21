class GemAgent < Formula
  desc "Interactive CLI agent on Vertex AI Gemini (Claude Code fallback)"
  homepage "https://github.com/nlink-jp/gem-agent"
  url "https://github.com/nlink-jp/gem-agent/releases/download/v0.30.0/gem-agent-v0.30.0-darwin-arm64.zip"
  sha256 "e9e375dc460c30c20a0f1d8b3d30c42c777603bf4a68cb5a57f8c3ce00d8bca1"
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
