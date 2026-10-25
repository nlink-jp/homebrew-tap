class GemQuery < Formula
  desc "Natural-language data analysis CLI for DuckDB and SQLite via Gemini"
  homepage "https://github.com/nlink-jp/gem-query"
  url "https://github.com/nlink-jp/gem-query/releases/download/v0.5.1/gem-query-v0.5.1-darwin-arm64.zip"
  sha256 "b13d8ce719e78c7b8e85c4dd1acedad2616d9b12d14857fcb23106bebc9c877a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-query"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-query --version")
  end
end
