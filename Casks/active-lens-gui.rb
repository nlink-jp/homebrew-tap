cask "active-lens-gui" do
  version "0.3.1"
  sha256 "7b6488062b5deec3e11b391dea7b7928173ed3ab5cae26f56e5d3acf44274914"

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
