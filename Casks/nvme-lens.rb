cask "nvme-lens" do
  version "0.1.4"
  sha256 "3cab33a911472d214eed96ef01228d47f624b0f2ec5f88051d7a14a5ff6ce9fc"

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
