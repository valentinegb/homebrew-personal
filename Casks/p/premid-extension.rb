cask "premid-extension" do
  version "2.2.4"
  sha256 "618c48a89fe6e00401c7aa87957758ed5f33a10bddbbcf902df34923823b8a23"

  url "https://github.com/PreMiD/Extension-Safari/releases/download/v#{version}/PreMiD.Extension.dmg",
      verified: "github.com/PreMiD/Extension-Safari/"
  name "PreMiD Safari Extension"
  desc "Safari extension for PreMiD, a program that displays website activity in Discord"
  homepage "https://premid.app/"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: ">= :mojave"

  app "PreMiD Extension.app"
end
