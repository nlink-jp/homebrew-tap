cask "zip-porter" do
  version "0.10.0"
  sha256 "5544254dba6a282d40ae6eca009ab2efb71a6a784de494cd8c91782a88e81f5a"

  url "https://github.com/nlink-jp/zip-porter/releases/download/v#{version}/zip-porter-v#{version}-darwin-arm64.zip"
  name "zip-porter"
  desc "Windows-safe ZIP creation and extraction for macOS (junk-free, NFC/CP932-aware, password-capable)"
  homepage "https://github.com/nlink-jp/zip-porter"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ZipPorter.app"
  binary "#{appdir}/ZipPorter.app/Contents/MacOS/ZipPorter", target: "zip-porter"

  zap trash: [
    "~/Library/Caches/jp.nlink.zip-porter",
    "~/Library/Preferences/jp.nlink.zip-porter.plist",
    "~/Library/Saved Application State/jp.nlink.zip-porter.savedState",
    "~/Library/WebKit/jp.nlink.zip-porter",
  ]
end
