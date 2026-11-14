class SensorLens < Formula
  desc "Collect SwitchBot temperature, humidity and CO2 into a local history"
  homepage "https://github.com/nlink-jp/sensor-lens"
  url "https://github.com/nlink-jp/sensor-lens/releases/download/v0.1.1/sensor-lens-v0.1.1-darwin-arm64.zip"
  sha256 "502bce8170cf8b45394d1870828a1525e3db72b5d38ba2ed23d38fde2d1ec56a"
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
