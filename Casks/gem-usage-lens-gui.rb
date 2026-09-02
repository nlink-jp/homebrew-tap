cask "gem-usage-lens-gui" do
  version "0.1.0"
  sha256 "abcf5701e93f8510d9a6bb852732061f5376c80402282ed0742128666a9e5744"

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
