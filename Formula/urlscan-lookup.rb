class UrlscanLookup < Formula
  desc "Investigate a suspicious URL via the urlscan.io API (CLI + MCP)"
  homepage "https://github.com/nlink-jp/urlscan-lookup"
  url "https://github.com/nlink-jp/urlscan-lookup/releases/download/v0.2.0/urlscan-lookup-v0.2.0-darwin-arm64.zip"
  sha256 "0cf70db735c6dcaef96b458d7c96b3290bb82b4e91f141d6968cce15c761e15b"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "urlscan-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/urlscan-lookup --version")
  end
end
