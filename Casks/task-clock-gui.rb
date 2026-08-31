cask "task-clock-gui" do
  version "0.2.1"
  sha256 "a902e411cd655abeed5cd46ba3f94578d4ed3f12df075d4ba134843a2fceb990"

  url "https://github.com/nlink-jp/task-clock-gui/releases/download/v#{version}/task-clock-gui-v#{version}-darwin-arm64.zip"
  name "task-clock-gui"
  desc "Menu-bar front end for the task-clock scheduler"
  homepage "https://github.com/nlink-jp/task-clock-gui"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TaskClock.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.task-clock-gui",
    "~/Library/Preferences/jp.nlink.task-clock-gui.plist",
    "~/Library/Saved Application State/jp.nlink.task-clock-gui.savedState",
    "~/Library/WebKit/jp.nlink.task-clock-gui",
  ]
end
