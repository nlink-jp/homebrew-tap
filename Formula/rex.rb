class Rex < Formula
  desc "Extract and merge fields from text with regular expressions"
  homepage "https://github.com/nlink-jp/rex"
  url "https://github.com/nlink-jp/rex/releases/download/v1.3.1/rex-v1.3.1-darwin-arm64.zip"
  sha256 "f735ec51686c230c7346e51f5ae3f8ef76b8ad2a05be3cac16a70b7a1dc45355"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "rex"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/rex --version")
  end
end
