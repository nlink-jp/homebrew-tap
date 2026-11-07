class VpnLookup < Formula
  desc "Tell whether an IP is a VPN, proxy, Tor, relay or hosting egress, and whose"
  homepage "https://github.com/nlink-jp/vpn-lookup"
  url "https://github.com/nlink-jp/vpn-lookup/releases/download/v0.1.0/vpn-lookup-v0.1.0-darwin-arm64.zip"
  sha256 "3d5a31a297c5c622648d10948fc83261c1fa538f2f9179d647ef5467d4d5180d"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "vpn-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/vpn-lookup --version")
  end
end
