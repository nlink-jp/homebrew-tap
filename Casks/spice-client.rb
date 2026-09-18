cask "spice-client" do
  version "0.2.1"
  sha256 "968e868393c21d45da7d3da88f4c14fe34009f310e043488dd2fa4e1cfe8be2d"

  url "https://github.com/nlink-jp/spice-client/releases/download/v#{version}/spice-client-v#{version}-darwin-arm64.zip"
  name "spice-client"
  desc "Native SPICE client for QEMU and Ravada virtual desktops"
  homepage "https://github.com/nlink-jp/spice-client"

  # Developer ID signed + Apple-notarized + stapled .app (Apple Silicon only).
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Spice Client.app"

  zap trash: [
    "~/Library/Caches/jp.nlink.spice-client",
    "~/Library/Preferences/jp.nlink.spice-client.plist",
    "~/Library/Saved Application State/jp.nlink.spice-client.savedState",
    "~/Library/WebKit/jp.nlink.spice-client",
  ]
end
