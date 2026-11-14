class Swrite < Formula
  desc "Post messages and files to Slack from your terminal"
  homepage "https://github.com/nlink-jp/swrite"
  url "https://github.com/nlink-jp/swrite/releases/download/v0.5.1/swrite-v0.5.1-darwin-arm64.zip"
  sha256 "b31ae251ee281a0ba94e77f178a1b778fa476290d47545c38e3ca8bedd47fe26"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "swrite"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/swrite --version")
  end
end
