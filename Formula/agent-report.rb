class AgentReport < Formula
  desc "Usage summary of gem-agent and lagent sessions to attach to a report"
  homepage "https://github.com/nlink-jp/agent-report"
  url "https://github.com/nlink-jp/agent-report/releases/download/v0.3.0/agent-report-v0.3.0-darwin-arm64.zip"
  sha256 "c456b4af2700e4de1910d0c45475feed1184f9fa13952ddc59636c32475ab579"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "agent-report"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/agent-report --version")
  end
end
