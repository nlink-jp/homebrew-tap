class Lagent < Formula
  desc "Sandboxed coding-agent runtime on a local LLM (LM Studio / Ollama)"
  homepage "https://github.com/nlink-jp/lagent"
  url "https://github.com/nlink-jp/lagent/releases/download/v0.25.0/lagent-v0.25.0-darwin-arm64.zip"
  sha256 "938afd169a5f7fe6809a91d69d90e4cea2defea79214b9f2d48ef8cdf289f0b3"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lagent"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/lagent --version")
  end
end
