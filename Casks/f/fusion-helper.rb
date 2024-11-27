cask "fusion-helper" do
  version "1.1.0"
  sha256 "608af97e36ae27744e507ac1a490894b748e1153fea61a3e32be05d86116b89a"

  url "https://github.com/Lakatrazz/Fusion-Helper/releases/download/v#{version}/FusionHelper_Mac.zip"
  name "Fusion Helper"
  desc "Proxy application to allow the use of BONELAB Fusion on the Meta Quests"
  homepage "https://github.com/Lakatrazz/Fusion-Helper"

  depends_on macos: ">= :big_sur"
  depends_on cask: "steam"

  app "FusionHelper_Mac.app"
end
