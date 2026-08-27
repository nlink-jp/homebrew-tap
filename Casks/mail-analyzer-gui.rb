cask "mail-analyzer-gui" do
  version "0.3.0"
  sha256 "f522126848ac2ccce9eb7710634c281b146ef7e7db7fc2bddeca1ba8460e307f"

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
