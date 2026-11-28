class ImageForge < Formula
  desc "Local diffusion image-generation engine and model manager"
  homepage "https://github.com/nlink-jp/image-forge"
  url "https://github.com/nlink-jp/image-forge/releases/download/v0.32.0/image-forge-v0.32.0-darwin-arm64.zip"
  sha256 "a19551c95e6442ef0ab0c2c4f628affc5565658ffb528d80dcf284cf768ab724"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "image-forge"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/image-forge --version")
  end
end
