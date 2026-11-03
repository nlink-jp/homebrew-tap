cask "image-forge-gui" do
  version "0.12.4"
  sha256 "6e98c7c0c0f2ec7365a87a451a5767da547ce6d553feea81a110f5ddc2a9e0aa"

  url "https://github.com/nlink-jp/image-forge-gui/releases/download/v#{version}/image-forge-gui-v#{version}-darwin-arm64.zip"
  name "image-forge-gui"
  desc "SwiftUI front-end for the image-forge local image generator"
  homepage "https://github.com/nlink-jp/image-forge-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ImageForgeGUI.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.image-forge-gui",
    "~/Library/Preferences/jp.nlink.image-forge-gui.plist",
    "~/Library/Saved Application State/jp.nlink.image-forge-gui.savedState",
    "~/Library/WebKit/jp.nlink.image-forge-gui",
  ]
end
