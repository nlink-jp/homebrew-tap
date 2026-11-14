class LiteRag < Formula
  desc "RAG CLI for Markdown documents using a local LLM"
  homepage "https://github.com/nlink-jp/lite-rag"
  url "https://github.com/nlink-jp/lite-rag/releases/download/v0.5.1/lite-rag-v0.5.1-darwin-arm64.zip"
  sha256 "81a739544625d127b032fba0e87d29a33c691e1326870c8286fc2323c36ceb26"
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
