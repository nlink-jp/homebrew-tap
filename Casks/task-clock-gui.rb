cask "task-clock-gui" do
  version "0.4.1"
  sha256 "b0fddee7c8673bddd54331bc3fab2e41a25d38580dfb9d7a942a290aa93e2826"

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
