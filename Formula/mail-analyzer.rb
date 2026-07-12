class MailAnalyzer < Formula
  desc "Suspicious-email analyzer combining rule indicators and Gemini"
  homepage "https://github.com/nlink-jp/mail-analyzer"
  url "https://github.com/nlink-jp/mail-analyzer/releases/download/v0.2.0/mail-analyzer-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "07209279d330e3afe6b593acb0871db06cb9dad43b29d24ac303e6c6fcdb921b"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mail-analyzer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mail-analyzer --version")
  end
end
