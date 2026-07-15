cask "load-spinner" do
  version "0.3.1"
  sha256 "6dbc61274e0a27a3b72a0ce7e983fb8335b36c47050adeeec27e541a09f837ff"

  url "https://github.com/nlink-jp/load-spinner/releases/download/v#{version}/load-spinner-v#{version}-darwin-arm64.zip"
  name "load-spinner"
  desc "Menu-bar CPU/GPU load indicator that spins with system load"
  homepage "https://github.com/nlink-jp/load-spinner"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "load-spinner.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.load-spinner",
    "~/Library/Preferences/jp.nlink.load-spinner.plist",
    "~/Library/Saved Application State/jp.nlink.load-spinner.savedState",
    "~/Library/WebKit/jp.nlink.load-spinner",
  ]
end
