class GemImage < Formula
  desc "Image generation and editing CLI using Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-image"
  url "https://github.com/nlink-jp/gem-image/releases/download/v0.5.1/gem-image-v0.5.1-darwin-arm64.zip"
  sha256 "94c6623f0f2b502cbb68cae2a0eb7929127ed7ff44571a91118c93458a4c12d1"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-image"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-image --version")
  end
end
