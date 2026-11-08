class MailAnalyzerLocal < Formula
  desc "Local-LLM email analyzer via an OpenAI-compatible API"
  homepage "https://github.com/nlink-jp/mail-analyzer-local"
  url "https://github.com/nlink-jp/mail-analyzer-local/releases/download/v0.6.0/mail-analyzer-local-v0.6.0-darwin-arm64.zip"
  sha256 "eb37dffb1b91663b196f09c9b4f679d6bdaa3cd1d62c18c163b5580cf6e5748b"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mail-analyzer-local"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/mail-analyzer-local --version")
  end
end
