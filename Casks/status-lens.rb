cask "status-lens" do
  version "0.1.1"
  sha256 "ccbef841de2cbf14b044b88f96d392362c2d0f4fc800bb1e7fc684dc121bea5a"

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
