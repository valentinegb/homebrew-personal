cask "fusion-helper" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 "1561bf79e894986a40c1c6fcd7ad98bfa99c5b85cc3b77c504fb50d735f52eea"

  url "https://github.com/Lakatrazz/Fusion-Helper/releases/download/v#{version}/FusionHelper_mac_#{arch}.zip"
  name "Fusion Helper"
  desc "Proxy application to allow the use of BONELAB Fusion on the Meta Quest 2"
  homepage "https://github.com/Lakatrazz/Fusion-Helper"

  depends_on macos: ">= :big_sur"
  depends_on cask: "steam"

  app "FusionHelper.app"
end
