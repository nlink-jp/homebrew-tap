cask "load-spinner" do
  version "0.5.4"
  sha256 "cd9fba4fa043f20d688b88a5ab003a163946740ed92aa176fdbb74e91f5f88e2"

  url "https://github.com/nlink-jp/load-spinner/releases/download/v#{version}/load-spinner-v#{version}-darwin-arm64.zip"
  name "load-spinner"
  desc "Menu-bar indicator that spins with CPU/GPU load, plus a memory gauge"
  homepage "https://github.com/nlink-jp/load-spinner"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "load-spinner.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.load-spinner",
    "~/Library/Preferences/jp.nlink.load-spinner.plist",
    "~/Library/Saved Application State/jp.nlink.load-spinner.savedState",
    "~/Library/WebKit/jp.nlink.load-spinner",
  ]
end
