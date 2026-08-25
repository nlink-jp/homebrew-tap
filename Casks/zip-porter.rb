cask "zip-porter" do
  version "0.11.2"
  sha256 "7f8f81a00f20046e42cb96f1578790351e9657036a3a3e4f5d65863c60e63cf2"

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
