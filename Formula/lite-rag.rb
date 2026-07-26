class LiteRag < Formula
  desc "RAG CLI for Markdown documents using a local LLM"
  homepage "https://github.com/nlink-jp/lite-rag"
  url "https://github.com/nlink-jp/lite-rag/releases/download/v0.3.1/lite-rag-v0.3.1-darwin-arm64.zip"
  version "0.3.1"
  sha256 "36f856421943982f44f186de46c36069d29fd9c03b32f03d697d78a852a9dbff"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lite-rag"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lite-rag --version")
  end
end
