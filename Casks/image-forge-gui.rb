cask "image-forge-gui" do
  version "0.10.0"
  sha256 "20582bb4d9d0d799fd6541a4804ede6802e5e1e5fb1c12ad6ff40d87e63455d8"

  url "https://github.com/nlink-jp/image-forge-gui/releases/download/v#{version}/image-forge-gui-v#{version}-darwin-arm64.zip"
  name "image-forge-gui"
  desc "SwiftUI front-end for the image-forge local image generator"
  homepage "https://github.com/nlink-jp/image-forge-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "ImageForgeGUI.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.image-forge-gui",
    "~/Library/Preferences/jp.nlink.image-forge-gui.plist",
    "~/Library/Saved Application State/jp.nlink.image-forge-gui.savedState",
    "~/Library/WebKit/jp.nlink.image-forge-gui",
  ]
end
