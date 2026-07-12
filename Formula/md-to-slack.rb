class MdToSlack < Formula
  desc "Markdown to Slack Block Kit JSON converter"
  homepage "https://github.com/nlink-jp/md-to-slack"
  url "https://github.com/nlink-jp/md-to-slack/releases/download/v0.2.0/md-to-slack-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "e070e42b915509bf1a3d86093b7c690e6541c81caf0c3c0c5044eebeca01a760"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "md-to-slack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/md-to-slack --version")
  end
end
