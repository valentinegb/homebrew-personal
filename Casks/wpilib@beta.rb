cask "wpilib@beta" do
  arch arm: "Arm64", intel: "Intel"
  url_arch = on_arch_conditional arm: "Arm", intel: ""

  version "2025.1.1-beta-3"
  sha256 arm:   "7e920bcc842999b7f56bd2d2824e287dd645fe9a67ab96907af7aed410accd23",
         intel: "95e131d0e60a6f2a9c1aee0b5106fa5ca4c3f5059502f0a31cf5ec99a1713463"

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
