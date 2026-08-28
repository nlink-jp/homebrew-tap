cask "mail-analyzer-gui" do
  version "0.3.2"
  sha256 "1224d4b8770f570504dbfb8ce1af194b1439319f207124190cd6bd349c527fc9"

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
