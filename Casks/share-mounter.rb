cask "share-mounter" do
  version "0.1.2"
  sha256 "137e44f95dce0d5843f0416e70e895e264ac97c8b9abf39da75be49461fe1be5"

  url "https://github.com/nlink-jp/share-mounter/releases/download/v#{version}/share-mounter-v#{version}-darwin-arm64.zip"
  name "share-mounter"
  desc "Menu-bar app that auto-mounts SMB shares at login, window-free"
  homepage "https://github.com/nlink-jp/share-mounter"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "ShareMounter.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.share-mounter",
    "~/Library/Preferences/jp.nlink.share-mounter.plist",
    "~/Library/Saved Application State/jp.nlink.share-mounter.savedState",
    "~/Library/WebKit/jp.nlink.share-mounter",
  ]
end
