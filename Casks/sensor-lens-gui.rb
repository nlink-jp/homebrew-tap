cask "sensor-lens-gui" do
  version "0.1.6"
  sha256 "833b40373e869d7f8e6230753bd2a14d20618318f937a69fb69afa27d393d0cf"

  url "https://github.com/nlink-jp/sensor-lens-gui/releases/download/v#{version}/sensor-lens-gui-v#{version}-darwin-arm64.zip"
  name "sensor-lens-gui"
  desc "Menu-bar readout of your SwitchBot temperature, humidity and CO2"
  homepage "https://github.com/nlink-jp/sensor-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "SensorLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.sensor-lens-gui",
    "~/Library/Preferences/jp.nlink.sensor-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.sensor-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.sensor-lens-gui",
  ]
end
