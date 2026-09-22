class GemScribe < Formula
  desc "Cloud speech-to-text CLI and MCP server on Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-scribe"
  url "https://github.com/nlink-jp/gem-scribe/releases/download/v0.5.3/gem-scribe-v0.5.3-darwin-arm64.zip"
  sha256 "f35ba9b6fd3eac443309981bd9291562d64fb6d7667e14b510e6fa132c5a30d0"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-scribe"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-scribe --version")
  end
end
