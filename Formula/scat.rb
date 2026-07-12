class Scat < Formula
  desc "Send content to Slack and other services from your terminal"
  homepage "https://github.com/nlink-jp/scat"
  url "https://github.com/nlink-jp/scat/releases/download/v1.15.0/scat-v1.15.0-darwin-arm64.zip"
  version "1.15.0"
  sha256 "887970b34a549af22fe12a2a475ecdf5a82de5d3a1fc2ab42947c756552ae657"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "scat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scat --version")
  end
end
