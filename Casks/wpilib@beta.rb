cask "wpilib@beta" do
  arch arm: "Arm64", intel: "Intel"
  url_arch = on_arch_conditional arm: "Arm", intel: ""

  version "2025.1.1-beta-2"
  sha256 arm:   "a921a565f837bf55333bd10b855f87a70631b2845f7cd5055333a1aa6963a2aa",
         intel: "afefb82cf3b97d010995de4da5af5f564ee7bdceeb0f477f55e373df3318e926"

  url "https://packages.wpilib.workers.dev/installer/v#{version}/macOS#{url_arch}/WPILib_macOS-#{arch}-#{version}.dmg",
      verified: "packages.wpilib.workers.dev/"
  name "WPILib"
  desc "Tools and libraries to create FRC robot programs"
  homepage "https://wpilib.org/"

  livecheck do
    url "https://github.com/wpilibsuite/allwpilib.git"
    strategy :git do |tags|
      tags.filter_map { |tag| tag[/^v(\d*.\d*.\d*-beta-\d*)$/i, 1] }
    end
  end

  depends_on macos: ">= :el_capitan"

  installer manual: "WPILibInstaller.app"

  uninstall delete: "~/wpilib/#{version.major}",
            rmdir:  "~/wpilib"
end
