class JsonToTable < Formula
  desc "Render JSON arrays as text, Markdown, or CSV tables"
  homepage "https://github.com/nlink-jp/json-to-table"
  url "https://github.com/nlink-jp/json-to-table/releases/download/v1.5.0/json-to-table-v1.5.0-darwin-arm64.zip"
  version "1.5.0"
  sha256 "5725cf90feebc85266f3e663f5eafb6b02e777da32845dfe1d9266e713dce28b"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "json-to-table"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/json-to-table --version")
  end
end
