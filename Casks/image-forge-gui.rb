cask "image-forge-gui" do
  version "0.12.0"
  sha256 "914bb184919ea203c44d5490c10c639ecfdfd9972fb4c7db2d4247a58143c7c0"

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
