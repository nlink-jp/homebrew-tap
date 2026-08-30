class ImageForge < Formula
  desc "Local diffusion image-generation engine and model manager"
  homepage "https://github.com/nlink-jp/image-forge"
  url "https://github.com/nlink-jp/image-forge/releases/download/v0.25.1/image-forge-v0.25.1-darwin-arm64.zip"
  sha256 "3d5c58d605aade793e52deb53ac8d420e5a8d3f919c7068ee3897045a9f34583"
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
