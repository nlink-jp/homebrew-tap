class GemSummary < Formula
  desc "Single-call Vertex AI Gemini text summarizer"
  homepage "https://github.com/nlink-jp/gem-summary"
  url "https://github.com/nlink-jp/gem-summary/releases/download/v0.3.2/gem-summary-v0.3.2-darwin-arm64.zip"
  sha256 "379b9f31feb2a84514cb4fad0488d42a7bfe1fc62cf2df1ca4d4b875e63fa5cf"
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
