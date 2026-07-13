cask "load-spinner" do
  version "0.1.1"
  sha256 "711aa33ec0f59b09ffe9d370f0c2da47a490a9fb26ae62e699865061ae1abe64"

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
