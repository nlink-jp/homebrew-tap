class ActiveLens < Formula
  desc "Content-free activity tracker recording when you work, not what"
  homepage "https://github.com/nlink-jp/active-lens"
  url "https://github.com/nlink-jp/active-lens/releases/download/v0.3.1/active-lens-v0.3.1-darwin-arm64.zip"
  sha256 "926ccd3aa6b5e74bf673ce88f70c129340d1a5dcde854519ae0e382502d33e6c"
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
