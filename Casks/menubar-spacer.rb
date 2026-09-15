cask "menubar-spacer" do
  version "0.1.0"
  sha256 "b39ab9515c9b8d78f0097c2afdb7103f7a6d447c23a167416229ac6495952d08"

  url "https://github.com/nlink-jp/menubar-spacer/releases/download/v#{version}/menubar-spacer-v#{version}-darwin-arm64.zip"
  name "menubar-spacer"
  desc "Adjust macOS menu bar icon spacing, with exact restore"
  homepage "https://github.com/nlink-jp/menubar-spacer"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "MenubarSpacer.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.menubar-spacer",
    "~/Library/Preferences/jp.nlink.menubar-spacer.plist",
    "~/Library/Saved Application State/jp.nlink.menubar-spacer.savedState",
    "~/Library/WebKit/jp.nlink.menubar-spacer",
  ]
end
