class GemScribe < Formula
  desc "Cloud speech-to-text CLI and MCP server on Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-scribe"
  url "https://github.com/nlink-jp/gem-scribe/releases/download/v0.1.0/gem-scribe-v0.1.0-darwin-arm64.zip"
  sha256 "10a4b13bd093e0870452e00157947f942fdb0171d6c2e3e1f8d04c9c2a61e683"
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
