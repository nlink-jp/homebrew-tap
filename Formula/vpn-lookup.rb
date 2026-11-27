class VpnLookup < Formula
  desc "Tell whether an IP is a VPN, proxy, Tor, relay or hosting egress, and whose"
  homepage "https://github.com/nlink-jp/vpn-lookup"
  url "https://github.com/nlink-jp/vpn-lookup/releases/download/v0.2.0/vpn-lookup-v0.2.0-darwin-arm64.zip"
  sha256 "9ab262feac6a2baea54cc72efa6736aba47d53ea2356cd719527921921ce6f9c"
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
