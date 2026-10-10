class ShodanLookup < Formula
  desc "What an IP exposes to the Internet, read from Shodan"
  homepage "https://github.com/nlink-jp/shodan-lookup"
  url "https://github.com/nlink-jp/shodan-lookup/releases/download/v0.1.3/shodan-lookup-v0.1.3-darwin-arm64.zip"
  sha256 "4695a68fc17c66ef46db815f168e5602741fc30eea54fb18b19830f14fdc96f5"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "shodan-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/shodan-lookup --version")
  end
end
