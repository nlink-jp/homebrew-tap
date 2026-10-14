cask "claude-usage-lens-gui" do
  version "0.4.0"
  sha256 "e44e7b20023417f3a57b1f26e03b3aa667a4df7ffb4edebdbeb9ec39c4a2fe41"

  url "https://github.com/nlink-jp/claude-usage-lens-gui/releases/download/v#{version}/claude-usage-lens-gui-v#{version}-darwin-arm64.zip"
  name "claude-usage-lens-gui"
  desc "Menu-bar app showing today's Claude usage cost with charts"
  homepage "https://github.com/nlink-jp/claude-usage-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ClaudeUsageLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.claude-usage-lens-gui",
    "~/Library/Preferences/jp.nlink.claude-usage-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.claude-usage-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.claude-usage-lens-gui",
  ]
end
