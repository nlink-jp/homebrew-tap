class VoiceScribe < Formula
  desc "Local speech-to-text engine and MCP server"
  homepage "https://github.com/nlink-jp/voice-scribe"
  url "https://github.com/nlink-jp/voice-scribe/releases/download/v0.4.4/voice-scribe-v0.4.4-darwin-arm64.zip"
  sha256 "d0cb99b9dbd456a2963dfa9385816dfce6a20b33ed7ef63076cc963a1fa07d06"
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
