class TaskClock < Formula
  desc "Resident macOS scheduler that does not trust launchd timing"
  homepage "https://github.com/nlink-jp/task-clock"
  url "https://github.com/nlink-jp/task-clock/releases/download/v0.1.0/task-clock-v0.1.0-darwin-arm64.zip"
  sha256 "c244268c8b84602582115b9e38f5f273ec33167bfcd1639e13418c16b778a7e3"
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
