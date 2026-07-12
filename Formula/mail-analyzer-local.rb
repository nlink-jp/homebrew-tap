class MailAnalyzerLocal < Formula
  desc "Local-LLM email analyzer via an OpenAI-compatible API"
  homepage "https://github.com/nlink-jp/mail-analyzer-local"
  url "https://github.com/nlink-jp/mail-analyzer-local/releases/download/v0.4.0/mail-analyzer-local-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "1e98eab84388b86109404a240fc27cb331f94fb4855071691de42d542f504958"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mail-analyzer-local"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mail-analyzer-local --version")
  end
end
