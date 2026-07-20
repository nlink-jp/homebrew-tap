cask "instant-translate" do
  version "0.1.3"
  sha256 "4e132f764fbfab242085665c26fcfa4202c5471aba86181e770542cfc0d0c514"

  url "https://github.com/nlink-jp/instant-translate/releases/download/v#{version}/instant-translate-v#{version}-darwin-arm64.zip"
  name "instant-translate"
  desc "Lightweight menu-bar translator using macOS on-device Translation"
  homepage "https://github.com/nlink-jp/instant-translate"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  # The app itself requires macOS 26 (LSMinimumSystemVersion) — the programmatic
  # Translation API isn't there before it. Without this, brew would happily install
  # a bundle the user's Mac can't launch.
  depends_on macos: :tahoe

  app "InstantTranslate.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.instant-translate",
    "~/Library/Preferences/jp.nlink.instant-translate.plist",
    "~/Library/Saved Application State/jp.nlink.instant-translate.savedState",
    "~/Library/WebKit/jp.nlink.instant-translate",
  ]
end
