cask "active-lens-gui" do
  version "0.2.2"
  sha256 "c01278c545e981d514981c8112de70c5978d44bb3310ae040e0753ddaf1a88c1"

  url "https://github.com/nlink-jp/active-lens-gui/releases/download/v#{version}/active-lens-gui-v#{version}-darwin-arm64.zip"
  name "active-lens-gui"
  desc "Menu-bar work-log app that visualizes operating time"
  homepage "https://github.com/nlink-jp/active-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "ActiveLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.active-lens-gui",
    "~/Library/Preferences/jp.nlink.active-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.active-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.active-lens-gui",
  ]
end
