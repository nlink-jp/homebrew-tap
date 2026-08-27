cask "mail-analyzer-gui" do
  version "0.3.1"
  sha256 "c0ab3614c993cb50e4357b9b3af513972bc77b2d5d37ae30a0b533c9dd59fa9e"

  url "https://github.com/nlink-jp/mail-analyzer-gui/releases/download/v#{version}/mail-analyzer-gui-v#{version}-darwin-arm64.zip"
  name "mail-analyzer-gui"
  desc "Drag-and-drop desktop app for suspicious email analysis"
  homepage "https://github.com/nlink-jp/mail-analyzer-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MailAnalyzerGUI.app"
  binary "#{appdir}/MailAnalyzerGUI.app/Contents/MacOS/MailAnalyzerGUI", target: "mail-analyzer-gui"

  zap trash: [
    "~/Library/Caches/jp.nlink.mail-analyzer-gui",
    "~/Library/Preferences/jp.nlink.mail-analyzer-gui.plist",
    "~/Library/Saved Application State/jp.nlink.mail-analyzer-gui.savedState",
    "~/Library/WebKit/jp.nlink.mail-analyzer-gui",
  ]
end
