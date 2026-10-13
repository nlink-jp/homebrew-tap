cask "gem-usage-lens-gui" do
  version "0.1.7"
  sha256 "809be6ed237da7635b0ef439f07db7b1c1a0ccd961c060640c515a22f83d6488"

  url "https://github.com/nlink-jp/gem-usage-lens-gui/releases/download/v#{version}/gem-usage-lens-gui-v#{version}-darwin-arm64.zip"
  name "gem-usage-lens-gui"
  desc "Menu-bar app showing today's gem-agent (Vertex AI Gemini) usage cost with charts and a monthly budget"
  homepage "https://github.com/nlink-jp/gem-usage-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "GemUsageLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.gem-usage-lens-gui",
    "~/Library/Preferences/jp.nlink.gem-usage-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.gem-usage-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.gem-usage-lens-gui",
  ]
end
