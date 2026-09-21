cask "net-meter" do
  version "0.2.0"
  sha256 "0cafcb2a160a635e4aabe8415c0772a09c5c43dc1e45e61ba54132dbea480b6f"

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
