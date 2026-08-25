cask "sensor-lens-gui" do
  version "0.1.5"
  sha256 "1349e464fee18f7052e955af6a872f73d237fe6e6557a1725ca72825436340a2"

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
