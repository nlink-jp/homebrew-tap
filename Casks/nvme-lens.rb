cask "nvme-lens" do
  version "0.1.5"
  sha256 "c3f4bf1cfce4cfbaedaa8feef71bf6a07c8677e7246a2c34e1ec8bbf4ba2e42e"

  url "https://github.com/nlink-jp/nvme-lens/releases/download/v#{version}/nvme-lens-v#{version}-darwin-arm64.zip"
  name "nvme-lens"
  desc "Menu-bar monitor for NVMe SSD temperature and endurance"
  homepage "https://github.com/nlink-jp/nvme-lens"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "NvmeLens.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.nvme-lens",
    "~/Library/Preferences/jp.nlink.nvme-lens.plist",
    "~/Library/Saved Application State/jp.nlink.nvme-lens.savedState",
    "~/Library/WebKit/jp.nlink.nvme-lens",
  ]
end
