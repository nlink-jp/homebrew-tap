cask "grid-edit" do
  version "0.2.1"
  sha256 "e296cf8f79ecc42cda8d3ae3d63907b055c83307093790eed86c406266917e8d"

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
