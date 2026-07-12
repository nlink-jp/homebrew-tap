class Lookup < Formula
  desc "Enrich JSON/JSONL streams by looking up values from tables"
  homepage "https://github.com/nlink-jp/lookup"
  url "https://github.com/nlink-jp/lookup/releases/download/v2.1.0/lookup-v2.1.0-darwin-arm64.zip"
  version "2.1.0"
  sha256 "a8b30212477da5d0aec074a39d53a118dc73d7404fdd69db6d34414c32587347"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lookup --version")
  end
end
