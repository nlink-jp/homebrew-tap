class OtxLookup < Formula
  desc "Campaign context for an indicator, from OTX community pulses"
  homepage "https://github.com/nlink-jp/otx-lookup"
  url "https://github.com/nlink-jp/otx-lookup/releases/download/v0.1.1/otx-lookup-v0.1.1-darwin-arm64.zip"
  sha256 "0e84ddfa7c2c1f7fd3e32b6c2108eddde4405c0406cd3338d8557fb17e195ddb"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "otx-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/otx-lookup --version")
  end
end
