cask "wpilib" do
  arch arm: "Arm64", intel: "Intel"
  url_arch = on_arch_conditional arm: "Arm", intel: ""

  version "2025.3.2"
  sha256 arm:   "5d957d12fa3c90ead5d3f6ddb33f951ed75990c1b2db1941f2c0433ffd3a53e3",
         intel: "bef1d56ba5cddbda7dc56c62932ff58e7460129a85e3e2ff3dcac5d9e01a3ff3"

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
