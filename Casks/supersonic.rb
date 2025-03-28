cask "supersonic" do
  arch arm: "arm64", intel: "x64"
  version "0.14.0"
  sha256 arm:   "f74d0f615b46157d07e9339d8790c233559066192ac9e43fdb332fd16124e9ab",
         intel: "3cbc5a8aa41f08d631eecf941d98db8bd3855e6e0758bff7ecc2eee5e4fd5be4"

  url "https://github.com/dweymouth/supersonic/releases/download/v#{version}/Supersonic-#{version}-mac-#{arch}.zip"
  name "Supersonic"
  desc "Desktop client for Subsonic and Jellyfin music servers"
  homepage "https://github.com/dweymouth/supersonic"

  depends_on macos: ">= :el_capitan"

  app "Supersonic.app"

  zap trash: [
    "~/Library/Application Support/supersonic",
    "~/Library/Caches/supersonic",
  ]
end
