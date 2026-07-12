class GemSummary < Formula
  desc "Single-call Vertex AI Gemini text summarizer"
  homepage "https://github.com/nlink-jp/gem-summary"
  url "https://github.com/nlink-jp/gem-summary/releases/download/v0.2.0/gem-summary-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "78c813729dd573e748f49678196aa33770f9881dc00093779651aac33166cd90"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-summary"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gem-summary --version")
  end
end
