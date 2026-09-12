class WebFetch < Formula
  desc "Fetch one URL's readable text from this machine, as a CLI and MCP server"
  homepage "https://github.com/nlink-jp/web-fetch"
  url "https://github.com/nlink-jp/web-fetch/releases/download/v0.1.0/web-fetch-v0.1.0-darwin-arm64.zip"
  sha256 "faebbc34408c33b3228f10006399d8ea9e4420aa36177b9553c110693ee4096a"
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
