class SplunkCli < Formula
  desc "Splunk CLI for running SPL queries and managing jobs"
  homepage "https://github.com/nlink-jp/splunk-cli"
  url "https://github.com/nlink-jp/splunk-cli/releases/download/v2.2.0/splunk-cli-v2.2.0-darwin-arm64.zip"
  version "2.2.0"
  sha256 "32cd4a16c369b79f0d663398831dd39dfef7f344ce33430b9cac5d8cd6adb827"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "splunk-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cli --version")
  end
end
