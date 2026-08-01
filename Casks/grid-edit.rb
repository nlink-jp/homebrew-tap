cask "grid-edit" do
  version "0.2.2"
  sha256 "e1aaaa8c2f44f8fe6efdba7d95b2f4ed04b50448264afd8b7c54a378be10a9d8"

  url "https://github.com/nlink-jp/grid-edit/releases/download/v#{version}/grid-edit-v#{version}-darwin-arm64.zip"
  name "grid-edit"
  desc "Native macOS CSV/TSV editor with Japanese-encoding and delimiter auto-detection"
  homepage "https://github.com/nlink-jp/grid-edit"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "GridEdit.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.grid-edit",
    "~/Library/Preferences/jp.nlink.grid-edit.plist",
    "~/Library/Saved Application State/jp.nlink.grid-edit.savedState",
    "~/Library/WebKit/jp.nlink.grid-edit",
  ]
end
