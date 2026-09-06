class Jviz < Formula
  desc "Visualize JSON data in the browser from your terminal"
  homepage "https://github.com/nlink-jp/jviz"
  url "https://github.com/nlink-jp/jviz/releases/download/v1.2.1/jviz-v1.2.1-darwin-arm64.zip"
  sha256 "b470dfe7edee60981dd8074db876b060c0d886aa0f51a919029e2a2f0908c4a7"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "jviz"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/jviz --version")
  end
end
