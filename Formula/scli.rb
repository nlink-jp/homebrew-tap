class Scli < Formula
  desc "Terminal Slack client for channels, DMs, search, and unread"
  homepage "https://github.com/nlink-jp/scli"
  url "https://github.com/nlink-jp/scli/releases/download/v1.9.0/scli-v1.9.0-darwin-arm64.zip"
  sha256 "e9ab715223a2224d68949b6edd58c026648a6fe6b6e3b4094a84c4d9612674c9"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "scli"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/scli --version")
  end
end
