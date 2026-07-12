class Mdv < Formula
  desc "Secure single-binary Markdown viewer and file browser"
  homepage "https://github.com/nlink-jp/markdown-viewer"
  url "https://github.com/nlink-jp/markdown-viewer/releases/download/v1.4.0/mdv-v1.4.0-darwin-arm64.zip"
  version "1.4.0"
  sha256 "8ba21ef2f215dec802bf43222236fc858532d1b53c3b85e6fb1ccd5e6e6c39cc"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "mdv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdv --version")
  end
end
