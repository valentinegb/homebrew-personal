cask "fusion-helper" do
  version "1.1.3"
  sha256 "e3f17d10e0bd86fd32e594914c450cefc1ff3144b072cd88a425e54a195cc6d2"

  url "https://github.com/Lakatrazz/Fusion-Helper/releases/download/v#{version}/FusionHelper_Mac.app.zip"
  name "Fusion Helper"
  desc "Proxy application to allow the use of BONELAB Fusion on Meta Quests"
  homepage "https://github.com/Lakatrazz/Fusion-Helper"

  depends_on macos: ">= :big_sur"
  depends_on cask: "steam"

  app "build/StandaloneOSX/StandaloneOSX.app", target: "Fusion Helper.app"
end
