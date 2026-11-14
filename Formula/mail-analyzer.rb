class MailAnalyzer < Formula
  desc "Suspicious-email analyzer combining rule indicators and Gemini"
  homepage "https://github.com/nlink-jp/mail-analyzer"
  url "https://github.com/nlink-jp/mail-analyzer/releases/download/v0.8.1/mail-analyzer-v0.8.1-darwin-arm64.zip"
  sha256 "aff224d19f5b69c3d78bb0b9e1fee423bc522228440ac0bbb0f8aef466c97356"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mail-analyzer"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/mail-analyzer --version")
  end
end
