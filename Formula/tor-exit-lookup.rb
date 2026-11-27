class TorExitLookup < Formula
  desc "Check whether an IP address is a Tor Exit node (offline)"
  homepage "https://github.com/nlink-jp/tor-exit-lookup"
  url "https://github.com/nlink-jp/tor-exit-lookup/releases/download/v0.3.0/tor-exit-lookup-v0.3.0-darwin-arm64.zip"
  sha256 "d1c0510e63eb45a3ab71db66581641cfb463302163fa313488ed794b58ea822b"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "tor-exit-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/tor-exit-lookup --version")
  end
end
