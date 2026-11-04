class LiteSwitch < Formula
  desc "Natural-language classifier for shell pipelines"
  homepage "https://github.com/nlink-jp/lite-switch"
  url "https://github.com/nlink-jp/lite-switch/releases/download/v0.3.0/lite-switch-v0.3.0-darwin-arm64.zip"
  sha256 "c7dbb03bf1d9d4f5f1ee63cbebf87baf2ef32f087e25f675046592ff32a49f42"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lite-switch"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/lite-switch --version")
  end
end
