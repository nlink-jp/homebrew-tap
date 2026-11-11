class ActiveLens < Formula
  desc "Content-free activity tracker recording when you work, not what"
  homepage "https://github.com/nlink-jp/active-lens"
  url "https://github.com/nlink-jp/active-lens/releases/download/v0.6.0/active-lens-v0.6.0-darwin-arm64.zip"
  sha256 "b0e7434d6e4017053ab909ac56c580a516b1a9b6d6e3b0fce94f7c15d0f196ee"
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
