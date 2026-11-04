class SplunkCli < Formula
  desc "Run SPL queries and manage search jobs on Splunk"
  homepage "https://github.com/nlink-jp/splunk-cli"
  url "https://github.com/nlink-jp/splunk-cli/releases/download/v3.0.0/splunk-cli-v3.0.0-darwin-arm64.zip"
  sha256 "3d4ac4a3b79bc7fe21d1d30ae58fe7c0d116d959745888c679d81fa80d15453a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "splunk-cli"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cli --version")
  end
end
