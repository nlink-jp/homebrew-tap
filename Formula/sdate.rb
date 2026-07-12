class Sdate < Formula
  desc "Compute timestamps using Splunk-like relative time syntax"
  homepage "https://github.com/nlink-jp/sdate"
  url "https://github.com/nlink-jp/sdate/releases/download/v1.2.0/sdate-v1.2.0-darwin-arm64.zip"
  version "1.2.0"
  sha256 "69a5528684be5c9fbf4ada476b0400535b74749c0d5dcd120429fa936093f7c2"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "sdate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sdate --version")
  end
end
