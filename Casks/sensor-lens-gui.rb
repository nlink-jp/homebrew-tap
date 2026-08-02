cask "sensor-lens-gui" do
  version "0.1.2"
  sha256 "041cfb1a4f1dc9d8796385e7448348464c2843dee3c54523177f7c79acad4abf"

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
