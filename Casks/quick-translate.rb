cask "quick-translate" do
  version "0.1.2"
  sha256 "0b33ed8e179e74d4d8501accc83c7ad5654a1fef32a950fcccaa910fc932272e"

  url "https://github.com/nlink-jp/quick-translate/releases/download/v#{version}/quick-translate-v#{version}-darwin-arm64.zip"
  name "quick-translate"
  desc "Menu-bar translation tool powered by a local LLM"
  homepage "https://github.com/nlink-jp/quick-translate"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "QuickTranslate.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.quick-translate",
    "~/Library/Preferences/jp.nlink.quick-translate.plist",
    "~/Library/Saved Application State/jp.nlink.quick-translate.savedState",
    "~/Library/WebKit/jp.nlink.quick-translate",
  ]
end
