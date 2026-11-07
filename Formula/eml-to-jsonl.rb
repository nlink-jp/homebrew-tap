class EmlToJsonl < Formula
  desc "EML parser for shell pipelines, emitting headers and body as JSONL"
  homepage "https://github.com/nlink-jp/eml-to-jsonl"
  url "https://github.com/nlink-jp/eml-to-jsonl/releases/download/v0.6.1/eml-to-jsonl-v0.6.1-darwin-arm64.zip"
  sha256 "9ac78688422e7ce41a79ec368cf2a097ffde0f41bbeb33827b61d6c5f44e64d4"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "eml-to-jsonl"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/eml-to-jsonl --version")
  end
end
