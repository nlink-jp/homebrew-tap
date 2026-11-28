class BraveSearch < Formula
  desc "Brave Search API (web, LLM context, answers) as a CLI and MCP server"
  homepage "https://github.com/nlink-jp/brave-search"
  url "https://github.com/nlink-jp/brave-search/releases/download/v0.2.0/brave-search-v0.2.0-darwin-arm64.zip"
  sha256 "9b9a97e455fd9bb54b1d864be252909ed17a3a1454650ba9e649797c605fb175"
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
