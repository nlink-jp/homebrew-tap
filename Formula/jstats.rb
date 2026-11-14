class Jstats < Formula
  desc "SPL-style stats aggregations for JSON streams"
  homepage "https://github.com/nlink-jp/jstats"
  url "https://github.com/nlink-jp/jstats/releases/download/v1.2.1/jstats-v1.2.1-darwin-arm64.zip"
  sha256 "2656448880d128b78abafefc846b1d03eeebbdc30c7784d0c05a72f1591ff814"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "jstats"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/jstats --version")
  end
end
