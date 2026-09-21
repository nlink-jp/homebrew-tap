cask "menubar-spacer" do
  version "0.1.2"
  sha256 "75a0c5fbf9f58fa726bc7a7d06492b65144383a3846ffc3a77633fcc437c630f"

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
