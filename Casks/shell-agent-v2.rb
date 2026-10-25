cask "shell-agent-v2" do
  version "0.18.1"
  sha256 "95be51e626c25f426e83a1e2a3cd0e903730f8096a0354b3e2ccea995e0a1e50"

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
