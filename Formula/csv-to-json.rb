class CsvToJson < Formula
  desc "Fast CSV-to-JSON converter for shell pipelines"
  homepage "https://github.com/nlink-jp/csv-to-json"
  url "https://github.com/nlink-jp/csv-to-json/releases/download/v1.1.1/csv-to-json-v1.1.1-darwin-arm64.zip"
  sha256 "4f5cc7bc7d4f3168932e18dce147a4acbfc34317a98cb1422e9cdcdaa14a4263"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "csv-to-json"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/csv-to-json --version")
  end
end
