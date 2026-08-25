cask "url-shelf" do
  version "0.1.1"
  sha256 "c14edc1972f0690ab50ee9fde34dfc0662e7fad14ee15231dfc4a9b4ce71315a"

  url "https://github.com/nlink-jp/url-shelf/releases/download/v#{version}/url-shelf-v#{version}-darwin-arm64.zip"
  name "url-shelf"
  desc "Menu-bar shelf of URL notes kept as .webloc files, with private-window opening"
  homepage "https://github.com/nlink-jp/url-shelf"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "URLShelf.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.url-shelf",
    "~/Library/Preferences/jp.nlink.url-shelf.plist",
    "~/Library/Saved Application State/jp.nlink.url-shelf.savedState",
    "~/Library/WebKit/jp.nlink.url-shelf",
  ]
end
