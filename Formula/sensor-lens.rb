class SensorLens < Formula
  desc "Collect SwitchBot temperature, humidity and CO2 into a local history"
  homepage "https://github.com/nlink-jp/sensor-lens"
  url "https://github.com/nlink-jp/sensor-lens/releases/download/v0.1.0/sensor-lens-v0.1.0-darwin-arm64.zip"
  version "0.1.0"
  sha256 "61f389212b74af106fa0e7bee08bca7f1626e1c6be9a3737efb803a4a57e4ae0"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "sensor-lens"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/sensor-lens --version")
  end
end
