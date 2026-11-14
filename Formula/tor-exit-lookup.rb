class TorExitLookup < Formula
  desc "Check whether an IP address is a Tor Exit node (offline)"
  homepage "https://github.com/nlink-jp/tor-exit-lookup"
  url "https://github.com/nlink-jp/tor-exit-lookup/releases/download/v0.2.1/tor-exit-lookup-v0.2.1-darwin-arm64.zip"
  sha256 "0f2d5286df33231eb4aeb5d31cdba61128bff9187239f1e8d0efd9122e766209"
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
