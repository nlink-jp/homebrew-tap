cask "load-spinner" do
  version "0.5.0"
  sha256 "c04c8c63f90994d6dc72ccd04b6d6eb5504b83024da8d677fac544c74b37ead3"

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
