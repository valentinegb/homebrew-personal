cask "premid" do
  version "2.2.0"
  sha256 "72d931d2e0c768e7cad909e0205d1ec2c84a9917069602e5b55c4aa99ddd4ee3"

  url "https://github.com/PreMiD/PreMiD/releases/download/app-v#{version}/PreMiD-darwin-x64.zip",
      verified: "github.com/PreMiD/PreMiD/"
  name "PreMiD"
  desc "Shows what you're doing on the web in your Discord activity"
  homepage "https://premid.app/"

  auto_updates true

  app "PreMiD.app"

  zap trash: [
    "~/Library/Application Support/PreMiD",
    "~/Library/Preferences/eu.Timeraa.PreMiD.plist",
    "~/Library/Saved Application State/eu.Timeraa.PreMiD.savedState",
  ]
end
