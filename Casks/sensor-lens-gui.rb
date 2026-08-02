cask "sensor-lens-gui" do
  version "0.1.0"
  sha256 "dcfe976d0c5614eaa61ace26119b2ded7df8d6d6fb03fbbd33c77cb4c6ea2483"

  url "https://github.com/nlink-jp/sensor-lens-gui/releases/download/v#{version}/sensor-lens-gui-v#{version}-darwin-arm64.zip"
  name "sensor-lens-gui"
  desc "Menu-bar readout of your SwitchBot temperature, humidity and CO2"
  homepage "https://github.com/nlink-jp/sensor-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "SensorLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.sensor-lens-gui",
    "~/Library/Preferences/jp.nlink.sensor-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.sensor-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.sensor-lens-gui",
  ]
end
