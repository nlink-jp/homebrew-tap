cask "zip-porter" do
  version "0.2.2"
  sha256 "4d898333069bdea632fa8a57f2731391e1163fc64a444244247ba00304fca4f6"

  url "https://github.com/nlink-jp/zip-porter/releases/download/v#{version}/zip-porter-v#{version}-darwin-arm64.zip"
  name "zip-porter"
  desc "Windows-safe ZIP creation and extraction for macOS (junk-free, NFC/CP932-aware, password-capable)"
  homepage "https://github.com/nlink-jp/zip-porter"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ZipPorter.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.zip-porter",
    "~/Library/Preferences/jp.nlink.zip-porter.plist",
    "~/Library/Saved Application State/jp.nlink.zip-porter.savedState",
    "~/Library/WebKit/jp.nlink.zip-porter",
  ]
end
