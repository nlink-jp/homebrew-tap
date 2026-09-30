class Timeout < Formula
  desc "Run a command with a time limit (POSIX and GNU compatible)"
  homepage "https://github.com/nlink-jp/timeout"
  url "https://github.com/nlink-jp/timeout/releases/download/v0.1.0/timeout-v0.1.0-darwin-arm64.zip"
  sha256 "e96115edd9c3c7d4b5b2616731a2d05876912c50cbca747e7c051220bf1d0d9f"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "timeout"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/timeout --version")
  end
end
