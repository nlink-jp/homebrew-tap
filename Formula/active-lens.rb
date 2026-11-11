class ActiveLens < Formula
  desc "Content-free activity tracker recording when you work, not what"
  homepage "https://github.com/nlink-jp/active-lens"
  url "https://github.com/nlink-jp/active-lens/releases/download/v0.5.0/active-lens-v0.5.0-darwin-arm64.zip"
  sha256 "d042010131fb2dc0531e41aa48b6cd6a6f729e1acd0cf2b9dcff87dfb54e1e5c"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "active-lens"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/active-lens --version")
  end
end
