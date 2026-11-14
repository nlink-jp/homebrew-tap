cask "shell-agent-v2" do
  version "0.18.2"
  sha256 "2d8c8ce2ed184dfce12e33a0a02a28c429615fd1d5f1bfc757e5bad344e19111"

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
