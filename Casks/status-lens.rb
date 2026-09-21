cask "status-lens" do
  version "0.1.4"
  sha256 "b14bbe6509bbe960e4464214cff8f591d786fac39e7ecf458fd2c56fd53260e2"

  url "https://github.com/nlink-jp/status-lens/releases/download/v#{version}/status-lens-v#{version}-darwin-arm64.zip"
  name "status-lens"
  desc "Menu-bar service status watcher for Statuspage-hosted pages"
  homepage "https://github.com/nlink-jp/status-lens"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "status-lens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.status-lens",
    "~/Library/Preferences/jp.nlink.status-lens.plist",
    "~/Library/Saved Application State/jp.nlink.status-lens.savedState",
    "~/Library/WebKit/jp.nlink.status-lens",
  ]
end
