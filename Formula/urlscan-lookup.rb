class UrlscanLookup < Formula
  desc "Investigate a suspicious URL via the urlscan.io API (CLI + MCP)"
  homepage "https://github.com/nlink-jp/urlscan-lookup"
  url "https://github.com/nlink-jp/urlscan-lookup/releases/download/v0.4.2/urlscan-lookup-v0.4.2-darwin-arm64.zip"
  sha256 "678c24fcb592f087c810a5b55bcb5a873047b0259b22b90ac16b01e8d3b72027"
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
