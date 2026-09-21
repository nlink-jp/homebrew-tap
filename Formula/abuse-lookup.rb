class AbuseLookup < Formula
  desc "Check IP address reputation against the AbuseIPDB API"
  homepage "https://github.com/nlink-jp/abuse-lookup"
  url "https://github.com/nlink-jp/abuse-lookup/releases/download/v0.3.0/abuse-lookup-v0.3.0-darwin-arm64.zip"
  sha256 "9febaec1eed690a3b7a5f3fd9ebbdc7cf789cc141f3a39ecc4c0a0d6619025c1"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "abuse-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/abuse-lookup --version")
  end
end
