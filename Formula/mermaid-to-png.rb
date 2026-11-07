class MermaidToPng < Formula
  desc "Turn a mermaid diagram into a PNG, with no browser"
  homepage "https://github.com/nlink-jp/mermaid-to-png"
  url "https://github.com/nlink-jp/mermaid-to-png/releases/download/v0.1.0/mermaid-to-png-v0.1.0-darwin-arm64.zip"
  sha256 "16103b9961286b0c54e75e908994c59597b6965734f88d877d2c60ab0e67db11"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mermaid-to-png"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/mermaid-to-png --version")
  end
end
