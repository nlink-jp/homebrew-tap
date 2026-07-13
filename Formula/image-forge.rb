class ImageForge < Formula
  desc "Local diffusion image-generation engine and model manager"
  homepage "https://github.com/nlink-jp/image-forge"
  url "https://github.com/nlink-jp/image-forge/releases/download/v0.24.0/image-forge-v0.24.0-darwin-arm64.zip"
  version "0.24.0"
  sha256 "04ebcc0bafcf504276ff68a1402acbaffe5a8a0eb2dd524f3c9acb3fbbf218c5"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "image-forge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/image-forge --version")
  end
end
