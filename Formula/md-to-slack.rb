class MdToSlack < Formula
  desc "Markdown to Slack Block Kit JSON converter"
  homepage "https://github.com/nlink-jp/md-to-slack"
  url "https://github.com/nlink-jp/md-to-slack/releases/download/v0.2.1/md-to-slack-v0.2.1-darwin-arm64.zip"
  sha256 "b523cd465856b87f6e0b6ec82fa822439bcd092f18cd5028566049265674988e"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "md-to-slack"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/md-to-slack --version")
  end
end
