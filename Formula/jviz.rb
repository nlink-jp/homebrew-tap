class Jviz < Formula
  desc "Visualize JSON data in the browser from your terminal"
  homepage "https://github.com/nlink-jp/jviz"
  url "https://github.com/nlink-jp/jviz/releases/download/v1.2.0/jviz-v1.2.0-darwin-arm64.zip"
  version "1.2.0"
  sha256 "aae23ee2349a28f8b305a38d684a169a70035994324cc6da08881a6b64756104"
  license "MIT"

  # Prebuilt, Developer ID signed + Apple-notarized Apple Silicon binary.
  # Building from source would strip the signature, so the tap installs the
  # notarized release asset as-is (arm64 only; darwin is Apple Silicon only).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "jviz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jviz --version")
  end
end
