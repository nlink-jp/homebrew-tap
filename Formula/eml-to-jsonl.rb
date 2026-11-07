class EmlToJsonl < Formula
  desc "EML parser for shell pipelines, emitting headers and body as JSONL"
  homepage "https://github.com/nlink-jp/eml-to-jsonl"
  url "https://github.com/nlink-jp/eml-to-jsonl/releases/download/v0.6.0/eml-to-jsonl-v0.6.0-darwin-arm64.zip"
  sha256 "d0a07eada50e94901b4b4fac2922e0b0c3467a950cabcd4c582960fcde68d419"
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
