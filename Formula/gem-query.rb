class GemQuery < Formula
  desc "Natural-language data analysis CLI for DuckDB and SQLite via Gemini"
  homepage "https://github.com/nlink-jp/gem-query"
  url "https://github.com/nlink-jp/gem-query/releases/download/v0.4.0/gem-query-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "ae176b46fd086271a9ebb8b48085a6efd32edfef40d2c2f96285ac45dd911b91"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-query"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gem-query --version")
  end
end
