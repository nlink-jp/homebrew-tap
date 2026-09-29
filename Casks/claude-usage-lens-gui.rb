cask "claude-usage-lens-gui" do
  version "0.3.4"
  sha256 "93a6bdcc7c6b1cbfcbd48ba64768175d5c28460deaeacf64f01efd4b12172be0"

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
