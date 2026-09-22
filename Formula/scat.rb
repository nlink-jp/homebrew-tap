class Scat < Formula
  desc "Slack CLI for services using bot credentials"
  homepage "https://github.com/nlink-jp/scat"
  url "https://github.com/nlink-jp/scat/releases/download/v2.1.1/scat-v2.1.1-darwin-arm64.zip"
  sha256 "8d9953cfad8b6adce9e070679f78be0b437d59d0a9a221f1c57bc75f7228cb60"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "scat"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/scat --version")
  end
end
