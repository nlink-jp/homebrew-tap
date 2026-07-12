class GemSearch < Formula
  desc "Agentic web search CLI using Vertex AI Grounding"
  homepage "https://github.com/nlink-jp/gem-search"
  url "https://github.com/nlink-jp/gem-search/releases/download/v0.4.0/gem-search-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "7fbc37c5424f7c25deaaa94ec0c007eee0990102131f5a782f38944274b13263"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap ships the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-search"
  end

  test do
    assert_match "gem-search", shell_output("#{bin}/gem-search --version")
  end
end
