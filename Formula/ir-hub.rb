class IrHub < Formula
  desc "Incident-response lifecycle hub as a Slack ChatOps bot"
  homepage "https://github.com/nlink-jp/ir-hub"
  url "https://github.com/nlink-jp/ir-hub/releases/download/v0.4.0/ir-hub-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "e75d7dc266e0a395bc48d4bfc302020997d2f5c3d53df15136cc063115b9afc2"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ir-hub"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ir-hub --version")
  end
end
