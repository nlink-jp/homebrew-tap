class GtiLookup < Formula
  desc "Curated threat-actor context for an indicator, from Google Threat Intelligence"
  homepage "https://github.com/nlink-jp/gti-lookup"
  url "https://github.com/nlink-jp/gti-lookup/releases/download/v0.1.2/gti-lookup-v0.1.2-darwin-arm64.zip"
  sha256 "16bef575c930fc392f283a0bf1f199e49560f834c05f9cd52458fefcf31be584"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gti-lookup"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/gti-lookup --version")
  end
end
