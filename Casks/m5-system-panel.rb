cask "m5-system-panel" do
  version "0.1.0"
  sha256 "0b82fb0e136b10bef1b4ef85fb209e7de4ea5516d826f1f6ce252723574d1f36"

  url "https://github.com/nlink-jp/m5-system-panel/releases/download/v#{version}/m5-system-panel-v#{version}-darwin-arm64.zip"
  name "m5-system-panel"
  desc "Menu-bar companion that shows CPU, GPU, memory and network on an M5Stack panel"
  homepage "https://github.com/nlink-jp/m5-system-panel"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "M5SystemPanel.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.m5-system-panel",
    "~/Library/Preferences/jp.nlink.m5-system-panel.plist",
    "~/Library/Saved Application State/jp.nlink.m5-system-panel.savedState",
    "~/Library/WebKit/jp.nlink.m5-system-panel",
  ]
end
