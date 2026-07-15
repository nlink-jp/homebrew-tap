class TorExitLookup < Formula
  desc "Check whether an IP address is a Tor Exit node (offline)"
  homepage "https://github.com/nlink-jp/tor-exit-lookup"
  url "https://github.com/nlink-jp/tor-exit-lookup/releases/download/v0.1.0/tor-exit-lookup-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "99c98721517ec80aa78b3684bf66a40441c6b1f4a5f5912fabfd49a3a1c945c6"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "tor-exit-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tor-exit-lookup --version")
  end
end
