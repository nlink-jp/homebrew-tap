class MacLookup < Formula
  desc "Resolve a MAC address or BSSID to its vendor and address type (offline)"
  homepage "https://github.com/nlink-jp/mac-lookup"
  url "https://github.com/nlink-jp/mac-lookup/releases/download/v0.3.0/mac-lookup-v0.3.0-darwin-arm64.zip"
  sha256 "c33432523ead1bc11f093c48eab5384c5d17ba888dba2aa021f6f2321d20ac5a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mac-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/mac-lookup --version")
  end
end
