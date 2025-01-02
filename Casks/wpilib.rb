cask "wpilib" do
  arch arm: "Arm64", intel: "Intel"
  url_arch = on_arch_conditional arm: "Arm", intel: ""

  version "2025.1.1"
  sha256 arm:   "e51bdecf830390b02a33e3203015aa53a198576e9dc0e23583a3ca08007d16eb",
         intel: "340e69a32c4b6baa651a6a79f220fa6ef3ef637a6b25fa52c934adc5361ce47a"

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
