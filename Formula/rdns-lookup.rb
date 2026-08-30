class RdnsLookup < Formula
  desc "Look up an IP's domains, a domain's subdomains, and reverse CNAMEs"
  homepage "https://github.com/nlink-jp/rdns-lookup"
  url "https://github.com/nlink-jp/rdns-lookup/releases/download/v0.2.0/rdns-lookup-v0.2.0-darwin-arm64.zip"
  sha256 "9d2b92a54f59e0727609ec88b708315b489fc593b117b35bc4c0ffb6ae8e3f75"
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
