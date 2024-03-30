cask "roblox" do
  version :latest
  sha256 :no_check

  url "https://www.roblox.com/download/client"
  name "Roblox"
  desc "Online game platform and game creation system"
  homepage "https://www.roblox.com/"

  depends_on macos: ">= :high_sierra"

  installer manual: "RobloxPlayerInstaller.app"

  uninstall quit: [
    "com.Roblox.Roblox",
    "com.roblox.RobloxPlayer",
    "com.roblox.RobloxPlayerInstaller",
  ]
  uninstall trash: "/Applications/Roblox.app"

  zap trash: [
    "~/Library/Caches/com.roblox.RobloxPlayer",
    "~/Library/HTTPStorages/com.roblox.RobloxPlayer.binarycookies",
    "~/Library/Logs/Roblox",
    "~/Library/Preferences/com.roblox.RobloxPlayer.plist",
    "~/Library/Preferences/com.roblox.RobloxPlayerChannel.plist",
    "~/Library/Roblox",
    "~/Library/WebKit/com.roblox.RobloxPlayer",
  ]
end
