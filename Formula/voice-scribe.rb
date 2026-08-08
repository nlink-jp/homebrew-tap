class VoiceScribe < Formula
  desc "Local speech-to-text engine and MCP server"
  homepage "https://github.com/nlink-jp/voice-scribe"
  url "https://github.com/nlink-jp/voice-scribe/releases/download/v0.1.0/voice-scribe-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "9ed7071ffd02c742adab4af5547dd7728708b774679ed8cf737b7835a09bb7fc"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "voice-scribe"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/voice-scribe --version")
  end
end
