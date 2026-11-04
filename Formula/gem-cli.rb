class GemCli < Formula
  desc "Gemini CLI client with multimodal, streaming, and grounding"
  homepage "https://github.com/nlink-jp/gem-cli"
  url "https://github.com/nlink-jp/gem-cli/releases/download/v0.5.0/gem-cli-v0.5.0-darwin-arm64.zip"
  sha256 "71ced48d3de88f939bd3ddcec10cfff38f0993ec4462cc8b0cab57ecc3b2c93a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gem-cli"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gem-cli --version")
  end
end
