class LiteRag < Formula
  desc "RAG CLI for Markdown documents using a local LLM"
  homepage "https://github.com/nlink-jp/lite-rag"
  url "https://github.com/nlink-jp/lite-rag/releases/download/v0.3.0/lite-rag-v0.3.0-darwin-arm64.zip"
  version "0.3.0"
  sha256 "527ba1917fc68ad302972eec969b32752d172107e46c9f80864a426052b82243"
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
