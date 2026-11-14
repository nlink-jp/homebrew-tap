class JsonToTable < Formula
  desc "Render JSON arrays as text, Markdown, or CSV tables"
  homepage "https://github.com/nlink-jp/json-to-table"
  url "https://github.com/nlink-jp/json-to-table/releases/download/v1.5.1/json-to-table-v1.5.1-darwin-arm64.zip"
  sha256 "57d1b04737dcdb0d53cfc9448e865b67da40ff8bbadbd466e02ed437afd1700a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "json-to-table"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/json-to-table --version")
  end
end
