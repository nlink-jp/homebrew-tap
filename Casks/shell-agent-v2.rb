cask "shell-agent-v2" do
  version "0.17.1"
  sha256 "2c89b9e84b596fe8c4b2aa890a8243a8070b928669845374202694271e87ecc7"

  url "https://github.com/nlink-jp/shell-agent-v2/releases/download/v#{version}/shell-agent-v2-v#{version}-darwin-arm64.zip"
  name "shell-agent-v2"
  desc "Local-first chat and agent tool with interactive data analysis"
  homepage "https://github.com/nlink-jp/shell-agent-v2"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "shell-agent-v2.app"

  zap trash: [
    "~/Library/Caches/com.wails.shell-agent-v2",
    "~/Library/Preferences/com.wails.shell-agent-v2.plist",
    "~/Library/Saved Application State/com.wails.shell-agent-v2.savedState",
    "~/Library/WebKit/com.wails.shell-agent-v2",
  ]
end
