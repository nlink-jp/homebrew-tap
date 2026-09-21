class VoiceScribe < Formula
  desc "Local speech-to-text engine and MCP server"
  homepage "https://github.com/nlink-jp/voice-scribe"
  url "https://github.com/nlink-jp/voice-scribe/releases/download/v0.4.6/voice-scribe-v0.4.6-darwin-arm64.zip"
  sha256 "193119a69cca6b4c1ab63d62174c1bd15581b5615e4aa263c160a3bb581b21aa"
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
