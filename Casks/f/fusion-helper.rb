cask "fusion-helper" do
  version "1.1.1"
  sha256 "c0e9fa8d4dced6d75b42490dc6bc73145614a32224aef9abc1a47e3e877d7063"

  url "https://github.com/Lakatrazz/Fusion-Helper/releases/download/v#{version}/FusionHelper_Mac.app.zip"
  name "Fusion Helper"
  desc "Proxy application to allow the use of BONELAB Fusion on the Meta Quests"
  homepage "https://github.com/Lakatrazz/Fusion-Helper"

  depends_on macos: ">= :big_sur"
  depends_on cask: "steam"

  app "FusionHelper_Mac.app"

  postflight do
    set_permissions "#{staged_path}/FusionHelper_Mac.app/Contents/MacOS/Fusion Helper", "0755"
  end
end
