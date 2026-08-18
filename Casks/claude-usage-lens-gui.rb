cask "claude-usage-lens-gui" do
  version "0.2.1"
  sha256 "0802a558534f5c32f8f56aba12ffc716b19aab1d6c1962305d6b7cd8ebc4bbfd"

  url "https://github.com/nlink-jp/claude-usage-lens-gui/releases/download/v#{version}/claude-usage-lens-gui-v#{version}-darwin-arm64.zip"
  name "claude-usage-lens-gui"
  desc "Menu-bar app showing today's Claude usage cost with charts"
  homepage "https://github.com/nlink-jp/claude-usage-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "ClaudeUsageLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.claude-usage-lens-gui",
    "~/Library/Preferences/jp.nlink.claude-usage-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.claude-usage-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.claude-usage-lens-gui",
  ]
end
