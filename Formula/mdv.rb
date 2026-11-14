class Mdv < Formula
  desc "Secure single-binary Markdown viewer and file browser"
  homepage "https://github.com/nlink-jp/markdown-viewer"
  url "https://github.com/nlink-jp/markdown-viewer/releases/download/v1.4.1/mdv-v1.4.1-darwin-arm64.zip"
  sha256 "62b24b95db29be7f239af55ac93093a49c68f919471e1e367ae873664bf2af3a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mdv"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/mdv --version")
  end
end
