class GemAgent < Formula
  desc "Interactive CLI agent runtime on Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-agent"
  url "https://github.com/nlink-jp/gem-agent/releases/download/v0.68.1/gem-agent-v0.68.1-darwin-arm64.zip"
  sha256 "db7dccebc4a7cdeb690ba8c9ace1816b3f62d6e49c1a1a6df439d97d29afe24d"
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
