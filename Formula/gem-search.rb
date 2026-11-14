class GemSearch < Formula
  desc "Agentic web search CLI using Vertex AI Grounding"
  homepage "https://github.com/nlink-jp/gem-search"
  url "https://github.com/nlink-jp/gem-search/releases/download/v0.5.1/gem-search-v0.5.1-darwin-arm64.zip"
  sha256 "5cc6ad486fded78bea512ee7953925b5e9844ee495b13752689df17d574217ee"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-search"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-search --version")
  end
end
