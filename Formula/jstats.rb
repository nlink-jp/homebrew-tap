class Jstats < Formula
  desc "SPL-style stats aggregations for JSON streams"
  homepage "https://github.com/nlink-jp/jstats"
  url "https://github.com/nlink-jp/jstats/releases/download/v1.2.0/jstats-v1.2.0-darwin-arm64.zip"
  version "1.2.0"
  sha256 "53f8cb97196999e8c89e4884339f3cf11505a4cf2fadcc1eb474b6b4645e19c4"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "jstats"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jstats --version")
  end
end
