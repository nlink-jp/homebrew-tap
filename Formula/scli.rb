class Scli < Formula
  desc "Terminal Slack client for channels, DMs, search, and unread"
  homepage "https://github.com/nlink-jp/scli"
  url "https://github.com/nlink-jp/scli/releases/download/v1.8.0/scli-v1.8.0-darwin-arm64.zip"
  version "1.8.0"
  sha256 "c8e643d28f7e555633a8716b28be23d6c6c5b681f603e925518db850ac5bf441"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "scli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scli --version")
  end
end
