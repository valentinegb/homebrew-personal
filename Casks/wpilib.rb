cask "wpilib" do
  arch arm: "Arm64", intel: "Intel"
  url_arch = on_arch_conditional arm: "Arm", intel: ""

  version "2025.3.1"
  sha256 arm:   "d2dfe3ab14d43d86ca7021c104aaa88843c07fc310b6cdb72a78d3ea4ac4bee9",
         intel: "924c0d5afd1b6f91748f50c6aec052696ec1d551795300b3621d94df84fba502"

  url "https://packages.wpilib.workers.dev/installer/v#{version}/macOS#{url_arch}/WPILib_macOS-#{arch}-#{version}.dmg",
      verified: "packages.wpilib.workers.dev/"
  name "WPILib"
  desc "Tools and libraries to create FRC robot programs"
  homepage "https://wpilib.org/"

  livecheck do
    url "https://github.com/wpilibsuite/allwpilib.git"
    strategy :git do |tags|
      tags.filter_map { |tag| tag[/^v(\d*.\d*.\d*)$/i, 1] }
    end
  end

  depends_on macos: ">= :el_capitan"

  installer manual: "WPILibInstaller.app"

  uninstall delete: "~/wpilib/#{version.major}",
            rmdir:  "~/wpilib"
end
