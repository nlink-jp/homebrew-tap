class GemSummary < Formula
  desc "Single-call Vertex AI Gemini text summarizer"
  homepage "https://github.com/nlink-jp/gem-summary"
  url "https://github.com/nlink-jp/gem-summary/releases/download/v0.3.0/gem-summary-v0.3.0-darwin-arm64.zip"
  sha256 "234111431e106053818abb2aee0bf58491908bb329a671d10b8a56577a02a2ba"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-summary"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-summary --version")
  end
end
