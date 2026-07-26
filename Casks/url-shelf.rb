cask "url-shelf" do
  version "0.1.0"
  sha256 "3e836f6b65be0d8e095f14b937d6944465b28f0d9ac3b0cefd60d041b549c7fb"

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
