cask "wpilib" do
  arch arm: "Arm64", intel: "Intel"
  url_arch = on_arch_conditional arm: "Arm", intel: ""

  version "2024.1.1"
  sha256 arm:   "69ee98b0456dae36cce9fe836024f9fcf5e7424a7bf75979b6a7a608ce74c78f",
         intel: "fb68cf2f5f8d6a5d7160e9e458f84dec31c29b5a8362d5128e4546589803de86"

  url "https://packages.wpilib.workers.dev/installer/v#{version}/macOS#{url_arch}/WPILib_macOS-#{arch}-#{version}.dmg",
      verified: "packages.wpilib.workers.dev/"
  name "WPILib"
  desc "Tools and libraries to create FRC robot programs"
  homepage "https://wpilib.org/"

  livecheck do
    url "https://github.com/wpilibsuite/allwpilib.git"
    strategy :git
  end

  depends_on macos: ">= :el_capitan"

  installer manual: "WPILibInstaller.app"

  uninstall delete: "~/wpilib/#{version.major}",
            rmdir:  "~/wpilib"
end
