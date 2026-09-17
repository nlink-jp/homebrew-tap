cask "spice-client" do
  version "0.1.0"
  sha256 "19f920fc362bcd27ae508392acf8a84d2dcab51a1dde4140398001152fb75131"

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
