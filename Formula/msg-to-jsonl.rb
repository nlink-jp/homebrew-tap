class MsgToJsonl < Formula
  desc "Outlook MSG parser for shell pipelines, emitting JSONL"
  homepage "https://github.com/nlink-jp/msg-to-jsonl"
  url "https://github.com/nlink-jp/msg-to-jsonl/releases/download/v0.6.1/msg-to-jsonl-v0.6.1-darwin-arm64.zip"
  sha256 "6b52a4feb4500cda2224a3782f34e9a68af8f2e238b2e308655b54ac6d9389a9"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "msg-to-jsonl"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/msg-to-jsonl --version")
  end
end
