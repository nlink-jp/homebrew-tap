cask "nvme-lens" do
  version "0.1.2"
  sha256 "e622cfcf33f7710faa512f7be1dbda2e8bd6fc10810af08a7a40ba03e2cacab9"

  url "https://github.com/nlink-jp/nvme-lens/releases/download/v#{version}/nvme-lens-v#{version}-darwin-arm64.zip"
  name "nvme-lens"
  desc "Menu-bar monitor for NVMe SSD temperature and endurance"
  homepage "https://github.com/nlink-jp/nvme-lens"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "NvmeLens.app"

  zap trash: [
    "~/Library/Application Support/nvme-lens",
    "~/Library/Caches/jp.nlink.nvme-lens",
    "~/Library/Preferences/jp.nlink.nvme-lens.plist",
    "~/Library/Saved Application State/jp.nlink.nvme-lens.savedState",
  ]
end
