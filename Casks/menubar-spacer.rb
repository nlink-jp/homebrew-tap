cask "menubar-spacer" do
  version "0.2.0"
  sha256 "b22cf29e4406792813b15ceaf2a572e44e9af5bdd604c6c9560208b1416a20ab"

  url "https://github.com/nlink-jp/menubar-spacer/releases/download/v#{version}/menubar-spacer-v#{version}-darwin-arm64.zip"
  name "menubar-spacer"
  desc "Adjust macOS menu bar icon spacing, with exact restore"
  homepage "https://github.com/nlink-jp/menubar-spacer"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "MenubarSpacer.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.menubar-spacer",
    "~/Library/Preferences/jp.nlink.menubar-spacer.plist",
    "~/Library/Saved Application State/jp.nlink.menubar-spacer.savedState",
    "~/Library/WebKit/jp.nlink.menubar-spacer",
  ]
end
