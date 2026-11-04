class GemSearch < Formula
  desc "Agentic web search CLI using Vertex AI Grounding"
  homepage "https://github.com/nlink-jp/gem-search"
  url "https://github.com/nlink-jp/gem-search/releases/download/v0.5.0/gem-search-v0.5.0-darwin-arm64.zip"
  sha256 "40f15ea07d2c1c53af65b0f911bdc01fb5dac8052c625946b16b55d284095466"
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
