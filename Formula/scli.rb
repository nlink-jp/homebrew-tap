class Scli < Formula
  desc "Terminal Slack client for channels, DMs, search, and unread"
  homepage "https://github.com/nlink-jp/scli"
  url "https://github.com/nlink-jp/scli/releases/download/v1.9.1/scli-v1.9.1-darwin-arm64.zip"
  sha256 "caf3e965fb1d86bd69cf7c269af705b7544bf2b208c5c394e53ef2ad62b1f154"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "scli"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/scli --version")
  end
end
