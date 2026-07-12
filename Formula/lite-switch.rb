class LiteSwitch < Formula
  desc "Natural-language classifier for shell pipelines"
  homepage "https://github.com/nlink-jp/lite-switch"
  url "https://github.com/nlink-jp/lite-switch/releases/download/v0.2.0/lite-switch-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "de7c6b3eb173da40a4077aafbeddd495525f6706b9dab8c8ff56f2b5681e1881"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lite-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lite-switch --version")
  end
end
