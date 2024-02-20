cask "wpilib" do
  arch arm: "Arm64", intel: "Intel"
  url_arch = on_arch_conditional arm: "Arm", intel: ""

  version "2024.3.1"
  sha256 arm:   "14fd3891e3c4438d2a121af68ced5da0eaeab7fc4e12471312aaf21ae9d80cea",
         intel: "0b41d45537585a4f913e2362c4a25ab32b220b2ba4a20ec009a8d8f0ce55606c"

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
