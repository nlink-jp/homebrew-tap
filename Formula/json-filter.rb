class JsonFilter < Formula
  desc "Robust JSON extraction, validation, and repair filter"
  homepage "https://github.com/nlink-jp/json-filter"
  url "https://github.com/nlink-jp/json-filter/releases/download/v2.1.0/json-filter-v2.1.0-darwin-arm64.zip"
  version "2.1.0"
  sha256 "07c3adceca701f2a952f97f37edd9ea949fb4cca65e7f3d151465d114792d364"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "json-filter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/json-filter --version")
  end
end
