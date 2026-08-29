class GemImage < Formula
  desc "Image generation and editing CLI using Vertex AI Gemini"
  homepage "https://github.com/nlink-jp/gem-image"
  url "https://github.com/nlink-jp/gem-image/releases/download/v0.4.0/gem-image-v0.4.0-darwin-arm64.zip"
  sha256 "009b6d3cc57260d390bf21b8617cbc17bf4e5fd57f52dce3b4983bcacc4a3b7a"
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
