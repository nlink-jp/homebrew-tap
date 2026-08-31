class TaskClock < Formula
  desc "Resident macOS scheduler that does not trust launchd timing"
  homepage "https://github.com/nlink-jp/task-clock"
  url "https://github.com/nlink-jp/task-clock/releases/download/v0.2.1/task-clock-v0.2.1-darwin-arm64.zip"
  sha256 "d1a67a9f4b49631a5fcdee76fe12a1d587904e8dbea0d5a01149cf186546989a"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "task-clock"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/task-clock --version")
  end
end
