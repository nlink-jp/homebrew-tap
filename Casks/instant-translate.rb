cask "instant-translate" do
  version "0.3.1"
  sha256 "7389daec1c15fe8c31dc508feaceaa8d0d7efac2f1f5e5f7bea7e1879ede34cd"

  url "https://github.com/nlink-jp/instant-translate/releases/download/v#{version}/instant-translate-v#{version}-darwin-arm64.zip"
  name "instant-translate"
  desc "Lightweight menu-bar translator using macOS on-device Translation"
  homepage "https://github.com/nlink-jp/instant-translate"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "InstantTranslate.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.instant-translate",
    "~/Library/Preferences/jp.nlink.instant-translate.plist",
    "~/Library/Saved Application State/jp.nlink.instant-translate.savedState",
    "~/Library/WebKit/jp.nlink.instant-translate",
  ]
end
