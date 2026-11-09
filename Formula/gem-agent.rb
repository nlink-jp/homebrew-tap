class GemAgent < Formula
  desc "Interactive CLI agent runtime on Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-agent"
  url "https://github.com/nlink-jp/gem-agent/releases/download/v0.100.0/gem-agent-v0.100.0-darwin-arm64.zip"
  sha256 "36dbc40b4f1c934742ba974d39eb5dc05a683a914935e6306a1cded8bb9dc340"
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
