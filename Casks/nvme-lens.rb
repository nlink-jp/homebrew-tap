cask "nvme-lens" do
  version "0.1.1"
  sha256 "f4345588f1ba60fa5f716fb8cf64ca1c16216527efdc18124261243ca1ae2bb4"

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
