cask "csv-editor" do
  version "0.2.1"
  sha256 "2000eaabb00f990504232737055fbc2c108f6e263a838dfa7923d56c47852b23"

  url "https://github.com/nlink-jp/csv-editor/releases/download/v#{version}/csv-editor-v#{version}-darwin-arm64.zip"
  name "csv-editor"
  desc "Viewer and editor for CSV and TSV files"
  homepage "https://github.com/nlink-jp/csv-editor"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "csv-editor.app"

  zap trash: [
    "~/Library/Caches/com.wails.csv-editor",
    "~/Library/Preferences/com.wails.csv-editor.plist",
    "~/Library/Saved Application State/com.wails.csv-editor.savedState",
    "~/Library/WebKit/com.wails.csv-editor",
  ]
end
