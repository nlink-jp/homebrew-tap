cask "mail-analyzer-gui" do
  version "0.2.2"
  sha256 "01740d67152959679a3918f1f92303a5750b13da287151e619a24e19ec0f231f"

  url "https://github.com/nlink-jp/mail-analyzer-gui/releases/download/v#{version}/mail-analyzer-gui-v#{version}-darwin-arm64.zip"
  name "mail-analyzer-gui"
  desc "Drag-and-drop desktop app for suspicious email analysis"
  homepage "https://github.com/nlink-jp/mail-analyzer-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "mail-analyzer-gui.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.mail-analyzer-gui",
    "~/Library/Preferences/jp.nlink.mail-analyzer-gui.plist",
    "~/Library/Saved Application State/jp.nlink.mail-analyzer-gui.savedState",
    "~/Library/WebKit/jp.nlink.mail-analyzer-gui",
  ]
end
