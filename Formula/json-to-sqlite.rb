class JsonToSqlite < Formula
  desc "Convert JSON to SQLite with automatic schema inference"
  homepage "https://github.com/nlink-jp/json-to-sqlite"
  url "https://github.com/nlink-jp/json-to-sqlite/releases/download/v1.3.1/json-to-sqlite-v1.3.1-darwin-arm64.zip"
  sha256 "8c1beaba5c2baa3a13836c1d996d95d0f7160f2e970d0b9d2ea2acace0badb50"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "json-to-sqlite"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/json-to-sqlite --version")
  end
end
