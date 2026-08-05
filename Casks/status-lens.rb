cask "status-lens" do
  version "0.1.0"
  sha256 "2a3e80c01b1ce0d25b8efa1df35fdcc0cd40c56c100d7d6868f09dba1649aafd"

  url "https://github.com/nlink-jp/status-lens/releases/download/v#{version}/status-lens-v#{version}-darwin-arm64.zip"
  name "status-lens"
  desc "Menu-bar service status watcher for Statuspage-hosted pages"
  homepage "https://github.com/nlink-jp/status-lens"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "status-lens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.status-lens",
    "~/Library/Preferences/jp.nlink.status-lens.plist",
    "~/Library/Saved Application State/jp.nlink.status-lens.savedState",
    "~/Library/WebKit/jp.nlink.status-lens",
  ]
end
