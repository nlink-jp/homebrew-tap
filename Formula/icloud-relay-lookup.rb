class IcloudRelayLookup < Formula
  desc "Check whether an IP address is an iCloud Private Relay egress IP (offline)"
  homepage "https://github.com/nlink-jp/icloud-relay-lookup"
  url "https://github.com/nlink-jp/icloud-relay-lookup/releases/download/v0.2.0/icloud-relay-lookup-v0.2.0-darwin-arm64.zip"
  sha256 "f66b83ff4340327141b66a73a257b082e6cdcc441ab324b4587edde8df813a13"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "icloud-relay-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/icloud-relay-lookup --version")
  end
end
