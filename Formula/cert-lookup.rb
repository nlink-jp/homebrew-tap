class CertLookup < Formula
  desc "Certificates issued for a domain: issuer, SAN names, revocation, from CT logs"
  homepage "https://github.com/nlink-jp/cert-lookup"
  url "https://github.com/nlink-jp/cert-lookup/releases/download/v0.1.1/cert-lookup-v0.1.1-darwin-arm64.zip"
  sha256 "b5d243388ac950ed8411da9a2a912e6d7da54afefaf58f459f23ad18c06dae48"
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
