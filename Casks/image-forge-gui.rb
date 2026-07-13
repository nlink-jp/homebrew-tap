cask "image-forge-gui" do
  version "0.9.2"
  sha256 "d64732cbddc7203eb57f2f4614c115f257079730527f72adad7b93c4bd8dc004"

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
