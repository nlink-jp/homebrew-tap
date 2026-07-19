cask "instant-translate" do
  version "0.1.0"
  sha256 "01510516f443456321fb15480aa5235d6f7ff98b92884758cd15055887836608"

  url "https://github.com/nlink-jp/instant-translate/releases/download/v#{version}/instant-translate-v#{version}-darwin-arm64.zip"
  name "instant-translate"
  desc "Lightweight menu-bar translator using macOS on-device Translation"
  homepage "https://github.com/nlink-jp/instant-translate"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "InstantTranslate.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.instant-translate",
    "~/Library/Preferences/jp.nlink.instant-translate.plist",
    "~/Library/Saved Application State/jp.nlink.instant-translate.savedState",
    "~/Library/WebKit/jp.nlink.instant-translate",
  ]
end
