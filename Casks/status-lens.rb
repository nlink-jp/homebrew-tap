cask "status-lens" do
  version "0.1.3"
  sha256 "7e58726ef1acd94770fbc42bc1049334c57636838ae073a3b637579c0e4b8696"

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
