cask "chromapper-launcher" do
  version :latest
  sha256 :no_check

  url "https://cm.topc.at/CML.app.zip"
  name "ChroMapper Launcher"
  desc "Launcher for ChroMapper, Unity-based map editor for Beat Saber"
  homepage "https://cm.topc.at/"

  depends_on macos: ">= :mojave"

  app "CML.app"

  uninstall delete: "/Applications/ChroMapper.app"

  zap trash: "~/Library/Application Support/com.BinaryElement.ChroMapper"

  caveats do
    requires_rosetta
  end
end
