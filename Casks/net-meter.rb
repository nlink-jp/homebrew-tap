cask "net-meter" do
  version "0.1.1"
  sha256 "3fb929e6013a370cb36f17a78f2b59008e8ddb300fbc48284a5982e5063ce1e6"

  url "https://github.com/nlink-jp/net-meter/releases/download/v#{version}/net-meter-v#{version}-darwin-arm64.zip"
  name "net-meter"
  desc "Menu bar meter for one network interface: up/down rate as numbers and a graph"
  homepage "https://github.com/nlink-jp/net-meter"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "NetMeter.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.net-meter",
    "~/Library/Preferences/jp.nlink.net-meter.plist",
    "~/Library/Saved Application State/jp.nlink.net-meter.savedState",
    "~/Library/WebKit/jp.nlink.net-meter",
  ]
end
