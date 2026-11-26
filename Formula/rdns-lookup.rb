class RdnsLookup < Formula
  desc "Look up an IP's domains, a domain's subdomains, and reverse CNAMEs"
  homepage "https://github.com/nlink-jp/rdns-lookup"
  url "https://github.com/nlink-jp/rdns-lookup/releases/download/v0.3.2/rdns-lookup-v0.3.2-darwin-arm64.zip"
  sha256 "e44b1d158f4eda6178b22b78f8b9f080d6ecdff3ff0f9325e5da0bd9b38b32f9"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "rdns-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/rdns-lookup --version")
  end
end
