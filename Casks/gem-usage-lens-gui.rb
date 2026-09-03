cask "gem-usage-lens-gui" do
  version "0.1.4"
  sha256 "74f74c7347b588a55952ade5cd18d4c6cfa717485b5c051080146ec528b44665"

  url "https://github.com/nlink-jp/gem-usage-lens-gui/releases/download/v#{version}/gem-usage-lens-gui-v#{version}-darwin-arm64.zip"
  name "gem-usage-lens-gui"
  desc "Menu-bar app showing today's gem-agent (Vertex AI Gemini) usage cost with charts and a monthly budget"
  homepage "https://github.com/nlink-jp/gem-usage-lens-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "GemUsageLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.gem-usage-lens-gui",
    "~/Library/Preferences/jp.nlink.gem-usage-lens-gui.plist",
    "~/Library/Saved Application State/jp.nlink.gem-usage-lens-gui.savedState",
    "~/Library/WebKit/jp.nlink.gem-usage-lens-gui",
  ]
end
