cask "zip-porter" do
  version "0.7.0"
  sha256 "b957994d2b3363208c7a44b4086cca50c27d99cd50270d454ca1b80506204f2b"

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
