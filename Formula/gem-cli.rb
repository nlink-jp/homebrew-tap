class GemCli < Formula
  desc "Gemini CLI client with multimodal, streaming, and grounding"
  homepage "https://github.com/nlink-jp/gem-cli"
  url "https://github.com/nlink-jp/gem-cli/releases/download/v0.4.0/gem-cli-v0.4.0-darwin-arm64.zip"
  version "0.4.0"
  sha256 "d55c122ff2b1f7ee0aef6651a3cff060ca1233540bde031b83ad2dc39c9261f4"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gem-cli --version")
  end
end
