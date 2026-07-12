class Stail < Formula
  desc "Read-only Slack CLI that streams and exports messages like tail -f"
  homepage "https://github.com/nlink-jp/stail"
  url "https://github.com/nlink-jp/stail/releases/download/v0.5.0/stail-v0.5.0-darwin-arm64.zip"
  version "0.5.0"
  sha256 "e23955881ac0c4fdcedbbef7a0ab056058a575d43636a0df6c77f11d995856de"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "stail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stail --version")
  end
end
