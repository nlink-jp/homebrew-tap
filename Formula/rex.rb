class Rex < Formula
  desc "Extract and merge fields from text with regular expressions"
  homepage "https://github.com/nlink-jp/rex"
  url "https://github.com/nlink-jp/rex/releases/download/v1.3.0/rex-v1.3.0-darwin-arm64.zip"
  version "1.3.0"
  sha256 "06db9d7a47d32c286d71795630320037a15761c73f2ac12c1fd8d9ba1b4f3f14"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "rex"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rex --version")
  end
end
