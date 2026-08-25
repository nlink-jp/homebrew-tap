cask "load-spinner" do
  version "0.5.1"
  sha256 "5e8f6a58d1262106f9df4e70aaabf8b342a8ba4b816177e95858823286e5ab7f"

  url "https://github.com/nlink-jp/load-spinner/releases/download/v#{version}/load-spinner-v#{version}-darwin-arm64.zip"
  name "load-spinner"
  desc "Menu-bar indicator that spins with CPU/GPU load, plus a memory gauge"
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
