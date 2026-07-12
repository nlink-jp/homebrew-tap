class GemImage < Formula
  desc "Image generation and editing CLI using Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-image"
  url "https://github.com/nlink-jp/gem-image/releases/download/v0.3.0/gem-image-v0.3.0-darwin-arm64.zip"
  version "0.3.0"
  sha256 "4f5850e19b3e0b348099fe7f6fd75a2b691d8739ef7fc0c5d3c1853d7f359447"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-image"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gem-image --version")
  end
end
