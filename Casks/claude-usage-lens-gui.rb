cask "claude-usage-lens-gui" do
  version "0.3.3"
  sha256 "c5b64fe642268bb18811d5ebc1e17bc3424d3d9ffa2143a3ed8f158a2aa473dc"

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
