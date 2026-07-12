class EmlToJsonl < Formula
  desc "EML parser for shell pipelines, emitting headers and body as JSONL"
  homepage "https://github.com/nlink-jp/eml-to-jsonl"
  url "https://github.com/nlink-jp/eml-to-jsonl/releases/download/v0.4.0/eml-to-jsonl-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "cd86e8687f7943cdc0dc801650b5d21832917206b6a5b6253cd54b4bdfcacc1d"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "eml-to-jsonl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eml-to-jsonl --version")
  end
end
