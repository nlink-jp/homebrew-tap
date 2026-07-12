class IrTimeline < Formula
  desc "Incident-response timeline recorder with browser UI and SQLite"
  homepage "https://github.com/nlink-jp/ir-timeline"
  url "https://github.com/nlink-jp/ir-timeline/releases/download/v0.2.0/ir-timeline-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "50a8ab917467f66a41982d0594308d8201ce0777d6870feb11b7763f52b71cd5"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ir-timeline"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ir-timeline --version")
  end
end
