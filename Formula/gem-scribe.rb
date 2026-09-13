class GemScribe < Formula
  desc "Cloud speech-to-text CLI and MCP server on Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-scribe"
  url "https://github.com/nlink-jp/gem-scribe/releases/download/v0.4.3/gem-scribe-v0.4.3-darwin-arm64.zip"
  sha256 "4271aa30139b5b94244e8dc01490a7a3e7953db789ad2290d8cdb826e32939fb"
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
