cask "nvme-lens" do
  version "0.1.0"
  sha256 "fd44ae32594366c3269a22a168dfd0b7a87aebf8c075e14b0e63faf74fc38fd9"

  url "https://github.com/nlink-jp/nvme-lens/releases/download/v#{version}/nvme-lens-v#{version}-darwin-arm64.zip"
  name "nvme-lens"
  desc "Menu-bar monitor for NVMe SSD temperature and endurance"
  homepage "https://github.com/nlink-jp/nvme-lens"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "NvmeLens.app"

  zap trash: [
    "~/Library/Application Support/nvme-lens",
    "~/Library/Caches/jp.nlink.nvme-lens",
    "~/Library/Preferences/jp.nlink.nvme-lens.plist",
    "~/Library/Saved Application State/jp.nlink.nvme-lens.savedState",
  ]
end
