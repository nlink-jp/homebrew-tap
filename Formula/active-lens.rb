class ActiveLens < Formula
  desc "Content-free activity tracker recording when you work, not what"
  homepage "https://github.com/nlink-jp/active-lens"
  url "https://github.com/nlink-jp/active-lens/releases/download/v0.2.1/active-lens-v0.2.1-darwin-arm64.zip"
  version "0.2.1"
  sha256 "7d19d34bf4219c04a4cd0b4b36d4013d2767d2e5434cd8f5c0a6f49417baaf45"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "active-lens"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/active-lens --version")
  end
end
