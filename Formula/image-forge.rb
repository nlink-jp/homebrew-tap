class ImageForge < Formula
  desc "Local diffusion image-generation engine and model manager"
  homepage "https://github.com/nlink-jp/image-forge"
  url "https://github.com/nlink-jp/image-forge/releases/download/v0.23.1/image-forge-v0.23.1-darwin-arm64.zip"
  version "0.23.1"
  sha256 "3dca4f9d5fca57b0e36fdaeca0c5b5c00990db087f6db619ed9bf754150b0757"
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
