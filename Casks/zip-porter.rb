cask "zip-porter" do
  version "0.14.0"
  sha256 "de2f530fd50cdc00b091a224140b4550f17225891271547d76165ee9d7ada5a6"

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
