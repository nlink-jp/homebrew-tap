cask "gem-usage-lens-gui" do
  version "0.2.2"
  sha256 "5fb3ca429f1e239e38c7d2e021f3decd510bcb3ee5714fae0e886d8b9302c5ef"

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
