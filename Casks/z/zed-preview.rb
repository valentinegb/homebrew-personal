cask "zed-preview" do
  version "0.119.8"
  sha256 "599d1d8863d4a458b2559ddcdf7333d0b2390e6883aa3c424c93eb7a6eee51e9"

  url "https://zed.dev/api/releases/preview/#{version}/Zed.dmg"
  name "Zed Preview"
  desc "Multiplayer code editor"
  homepage "https://zed.dev/"

  livecheck do
    url "https://zed.dev/releases/preview"
    regex(%r{href=.*?/preview/(\d+(?:\.\d+)+)/Zed.dmg}i)
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Zed Preview.app"
  binary "#{appdir}/Zed Preview.app/Contents/MacOS/cli", target: "zed"

  zap trash: [
    "~/.config/zed",
    "~/Library/Application Support/Zed",
    "~/Library/Logs/Zed",
    "~/Library/Saved Application State/dev.zed.Zed-Preview.savedState",
  ]
end
