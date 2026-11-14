class IrTimeline < Formula
  desc "Incident-response timeline recorder with browser UI and SQLite"
  homepage "https://github.com/nlink-jp/ir-timeline"
  url "https://github.com/nlink-jp/ir-timeline/releases/download/v0.2.1/ir-timeline-v0.2.1-darwin-arm64.zip"
  sha256 "63914fef777ba6886ccd97a4bb56f6e254ae5540a4443555e874eb691a791713"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ir-timeline"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/ir-timeline --version")
  end
end
