class IcloudRelayLookup < Formula
  desc "Check whether an IP address is an iCloud Private Relay egress IP (offline)"
  homepage "https://github.com/nlink-jp/icloud-relay-lookup"
  url "https://github.com/nlink-jp/icloud-relay-lookup/releases/download/v0.1.0/icloud-relay-lookup-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "ca2bb5a4522958d66478c397eb4894d1ee550380632dd4cbcc813aa71321d70a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "icloud-relay-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/icloud-relay-lookup --version")
  end
end
