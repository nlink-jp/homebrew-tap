class OpenctiLookup < Formula
  desc "Read-only threat-intelligence lookups against your OpenCTI instance"
  homepage "https://github.com/nlink-jp/opencti-lookup"
  url "https://github.com/nlink-jp/opencti-lookup/releases/download/v0.1.0/opencti-lookup-v0.1.0-darwin-arm64.zip"
  sha256 "bca72bcce38e60636138fd2729f4237bc5fdbc5c71b8c7f4d3279011566c3d7e"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "opencti-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/opencti-lookup --version")
  end
end
