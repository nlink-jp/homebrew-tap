cask "instant-translate" do
  version "0.4.1"
  sha256 "bcb905c866e9d7c389fe1844bdf2163d6a39f4b598c789f44d312cbd0f47a98e"

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
