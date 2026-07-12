class LlmCli < Formula
  desc "OpenAI-compatible command-line client for local and cloud LLMs"
  homepage "https://github.com/nlink-jp/llm-cli"
  url "https://github.com/nlink-jp/llm-cli/releases/download/v0.2.0/llm-cli-v0.2.0-darwin-arm64.zip"
  version "0.2.0"
  sha256 "0cc36a948ca7f8a8e80e6cf1e8a1a49c00016d77a8c39cb0c53152dfeb71961c"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap ships the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "llm-cli"
  end

  test do
    assert_match "llm-cli", shell_output("#{bin}/llm-cli --version")
  end
end
