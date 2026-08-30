class AsnLookup < Formula
  desc "Local IP-to-ASN and ASN-to-prefix lookups from the IPinfo Lite database"
  homepage "https://github.com/nlink-jp/asn-lookup"
  url "https://github.com/nlink-jp/asn-lookup/releases/download/v0.2.0/asn-lookup-v0.2.0-darwin-arm64.zip"
  sha256 "5bc178ab502a0c43349ea1a08428c7638431351d6422681d672a59d99e61936d"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "asn-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/asn-lookup --version")
  end
end
