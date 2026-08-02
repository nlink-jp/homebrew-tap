cask "grid-edit" do
  version "0.2.4"
  sha256 "0fa24280ce5d3a216f448368662fb294767e23a55e7b66b9b4893fe39c4b7e63"

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
