cask "image-forge-gui" do
  version "0.9.1"
  sha256 "95ca57b90d798d9178f12f305be629083615fcf286d9ee96b9667bba2a8f0a1b"

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
