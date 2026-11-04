class DataAnalyzer < Formula
  desc "Large-scale JSON/JSONL analysis CLI using local LLMs"
  homepage "https://github.com/nlink-jp/data-analyzer"
  url "https://github.com/nlink-jp/data-analyzer/releases/download/v0.5.0/data-analyzer-v0.5.0-darwin-arm64.zip"
  sha256 "54ce3508ae0fed0747b260caebcc3350266fd864948967412f453aa543c7377c"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "data-analyzer"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/data-analyzer --version")
  end
end
