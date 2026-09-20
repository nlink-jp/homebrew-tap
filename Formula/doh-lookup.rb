class DohLookup < Formula
  desc "Collect a domain's DNS records over DoH (out-of-band, distinguishable)"
  homepage "https://github.com/nlink-jp/doh-lookup"
  url "https://github.com/nlink-jp/doh-lookup/releases/download/v0.1.2/doh-lookup-v0.1.2-darwin-arm64.zip"
  sha256 "9410e7cd51963c5ce4177f9bb5dde8eb60c760fbbca9cad963f13becbbd7e9fd"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "doh-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/doh-lookup --version")
  end
end
