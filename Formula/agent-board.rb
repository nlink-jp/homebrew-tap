class AgentBoard < Formula
  desc "Machine-local shared knowledge board for concurrent AI agent sessions (CLI + hooks + MCP)"
  homepage "https://github.com/nlink-jp/agent-board"
  url "https://github.com/nlink-jp/agent-board/releases/download/v0.1.0/agent-board-v0.1.0-darwin-arm64.zip"
  sha256 "c17c42a3ccd69312e10647840e766f0e965a59633ed4fb408d274c2b08430bb3"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "agent-board"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/agent-board --version")
  end
end
