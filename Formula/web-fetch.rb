class WebFetch < Formula
  desc "Fetch one URL's readable text from this machine, as a CLI and MCP server"
  homepage "https://github.com/nlink-jp/web-fetch"
  url "https://github.com/nlink-jp/web-fetch/releases/download/v0.1.1/web-fetch-v0.1.1-darwin-arm64.zip"
  sha256 "5e65ca4e7edf9494a7a324b5640f8443a18ea35d626d67d961a9f38452826e28"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "web-fetch"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/web-fetch --version")
  end
end
