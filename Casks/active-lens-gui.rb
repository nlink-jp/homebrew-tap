cask "active-lens-gui" do
  version "0.4.0"
  sha256 "f3028f8de3d5ce96c11fe5072ebf9398829bff1281f53fac0fd9c51bb99908bd"

  url "https://github.com/nlink-jp/active-lens-gui/releases/download/v#{version}/active-lens-gui-v#{version}-darwin-arm64.zip"
  name "active-lens-gui"
  desc "Menu-bar work-log app that visualizes operating time"
  homepage "https://github.com/nlink-jp/active-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ActiveLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.active-lens-gui",
    "~/Library/Preferences/jp.nlink.active-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.active-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.active-lens-gui",
  ]
end
