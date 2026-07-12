class Swrite < Formula
  desc "Post messages and files to Slack from your terminal"
  homepage "https://github.com/nlink-jp/swrite"
  url "https://github.com/nlink-jp/swrite/releases/download/v0.4.0/swrite-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "2bc5937e4e4d1218dd9c9d9bc843dc0054f78019f1dafe2057ec470ab47947fe"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "swrite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swrite --version")
  end
end
