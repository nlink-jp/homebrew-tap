class MsgToJsonl < Formula
  desc "Outlook MSG parser for shell pipelines, emitting JSONL"
  homepage "https://github.com/nlink-jp/msg-to-jsonl"
  url "https://github.com/nlink-jp/msg-to-jsonl/releases/download/v0.4.0/msg-to-jsonl-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "89ac5c5e42563ade96d55780665fcd305e934cccdbccbf80525b913cc28c0031"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "msg-to-jsonl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/msg-to-jsonl --version")
  end
end
