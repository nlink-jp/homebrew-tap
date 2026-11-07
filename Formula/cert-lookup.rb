class CertLookup < Formula
  desc "Certificates issued for a domain: issuer, SAN names, revocation, from CT logs"
  homepage "https://github.com/nlink-jp/cert-lookup"
  url "https://github.com/nlink-jp/cert-lookup/releases/download/v0.1.0/cert-lookup-v0.1.0-darwin-arm64.zip"
  sha256 "4551cf1bcf00356558dba3c8e10cc72db427c22cd232c83ed18384c7fc2ab4de"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "cert-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/cert-lookup --version")
  end
end
