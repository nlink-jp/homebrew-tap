class DataAnalyzer < Formula
  desc "Large-scale JSON/JSONL analysis CLI using local LLMs"
  homepage "https://github.com/nlink-jp/data-analyzer"
  url "https://github.com/nlink-jp/data-analyzer/releases/download/v0.4.0/data-analyzer-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "c8fa09196da3a622cd2336c40858aa0bad22364197fd40e4da3f60bccbf6bd8d"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "data-analyzer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/data-analyzer --version")
  end
end
