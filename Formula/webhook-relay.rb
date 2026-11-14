class WebhookRelay < Formula
  desc "Authenticated webhook receiver that writes payloads to GCS"
  homepage "https://github.com/nlink-jp/webhook-relay"
  url "https://github.com/nlink-jp/webhook-relay/releases/download/v0.3.1/webhook-relay-v0.3.1-darwin-arm64.zip"
  sha256 "57f76ef1f0117468195e2d43eea904b4b2ccd0dfe2a9fddc4609475ef090b9b3"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "webhook-relay"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/webhook-relay --version")
  end
end
