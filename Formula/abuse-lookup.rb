class AbuseLookup < Formula
  desc "Check IP address reputation against the AbuseIPDB API"
  homepage "https://github.com/nlink-jp/abuse-lookup"
  url "https://github.com/nlink-jp/abuse-lookup/releases/download/v0.1.0/abuse-lookup-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "8a447902b57dda06b9aa994184049f3e3a8c4013a05f5993ba4e0beb7ff9ab72"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "abuse-lookup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abuse-lookup --version")
  end
end
