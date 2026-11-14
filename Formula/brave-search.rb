class BraveSearch < Formula
  desc "Brave Search API (web, LLM context, answers) as a CLI and MCP server"
  homepage "https://github.com/nlink-jp/brave-search"
  url "https://github.com/nlink-jp/brave-search/releases/download/v0.1.2/brave-search-v0.1.2-darwin-arm64.zip"
  sha256 "cd50d265d2c120dafe74a9c2b0ae4c64d2cc21e83905d942447fc9b41aaf7e19"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "brave-search"
  end

  # The tool MUST answer `--version`, not only a `version` subcommand: without
  # the flag it exits non-zero, `shell_output` raises, and `brew test` fails —
  # while `brew install` still succeeds, so the breakage only surfaces once the
  # tool is in the tap. With cobra, `rootCmd.Version = Version` provides the
  # flag; keep its output identical to the subcommand's and pin both in a test.
  test do
    assert_match version.to_s, shell_output("#{bin}/brave-search --version")
  end
end
