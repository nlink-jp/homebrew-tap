class WhoisLookup < Formula
  desc "Look up domain/IP/ASN registration data via RDAP with WHOIS fallback"
  homepage "https://github.com/nlink-jp/whois-lookup"
  url "https://github.com/nlink-jp/whois-lookup/releases/download/v0.2.2/whois-lookup-v0.2.2-darwin-arm64.zip"
  sha256 "1f04c6222c82478356af59c3a9c3ec108e42012d789c32f51df9128ede4198b3"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "whois-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/whois-lookup --version")
  end
end
