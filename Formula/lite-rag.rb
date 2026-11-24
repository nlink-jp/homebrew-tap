class LiteRag < Formula
  desc "RAG CLI for Markdown documents using a local LLM"
  homepage "https://github.com/nlink-jp/lite-rag"
  url "https://github.com/nlink-jp/lite-rag/releases/download/v0.5.2/lite-rag-v0.5.2-darwin-arm64.zip"
  sha256 "1d194d6dd2eb5d0a1df0ba99abe4c9a6bd3493bb21bfa4c507b63f73a41e010a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lite-rag"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/lite-rag --version")
  end
end
