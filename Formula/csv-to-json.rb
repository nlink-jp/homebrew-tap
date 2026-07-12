class CsvToJson < Formula
  desc "Fast CSV-to-JSON converter for shell pipelines"
  homepage "https://github.com/nlink-jp/csv-to-json"
  url "https://github.com/nlink-jp/csv-to-json/releases/download/v1.1.0/csv-to-json-v1.1.0-darwin-arm64.zip"
  version "1.1.0"
  sha256 "2e038f765667196a125b042045e98e2e134b04efe386fed44d34ad79e45ebee5"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "csv-to-json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/csv-to-json --version")
  end
end
