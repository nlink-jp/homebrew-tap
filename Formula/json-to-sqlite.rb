class JsonToSqlite < Formula
  desc "Convert JSON to SQLite with automatic schema inference"
  homepage "https://github.com/nlink-jp/json-to-sqlite"
  url "https://github.com/nlink-jp/json-to-sqlite/releases/download/v1.3.0/json-to-sqlite-v1.3.0-darwin-arm64.zip"
  version "1.3.0"
  sha256 "da694e944a13fef3f082365672d64f410014535287f1237236d0c0d4ef7cdca2"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "json-to-sqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/json-to-sqlite --version")
  end
end
