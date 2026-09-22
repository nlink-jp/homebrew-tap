class Stail < Formula
  desc "Read-only Slack CLI that streams and exports messages like tail -f"
  homepage "https://github.com/nlink-jp/stail"
  url "https://github.com/nlink-jp/stail/releases/download/v0.6.0/stail-v0.6.0-darwin-arm64.zip"
  sha256 "651e8d5eb8ee60f5e0a8a44e7fc0c9048593a390987ec128da7de5e578dd87aa"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "stail"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/stail --version")
  end
end
