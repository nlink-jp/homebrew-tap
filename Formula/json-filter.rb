class JsonFilter < Formula
  desc "Robust JSON extraction, validation, and repair filter"
  homepage "https://github.com/nlink-jp/json-filter"
  url "https://github.com/nlink-jp/json-filter/releases/download/v2.1.1/json-filter-v2.1.1-darwin-arm64.zip"
  sha256 "76f00f1fab02c66e32e56a02d0181f851a998a85cf2d9afe2bd6b368f2928ef2"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "json-filter"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/json-filter --version")
  end
end
