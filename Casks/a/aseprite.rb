cask "aseprite" do
  version "1.3.4"
  sha256 "a7b46896b520ce7baff702fb44599cf785985621f1902e11f3369f9413377e92"

  url "https://www.aseprite.org/downloads/trial/Aseprite-v#{version}-trial-macOS.dmg"
  name "Aseprite"
  desc "Animated sprite editor & pixel art tool"
  homepage "https://www.aseprite.org/"

  livecheck do
    formula "aseprite"
  end

  depends_on formula: "aseprite"

  app "Aseprite.app"

  preflight do
    FileUtils.rm "#{staged_path}/Aseprite.app/Contents/MacOS/aseprite"
    FileUtils.ln "#{Formula["aseprite"].bin}/aseprite", "#{staged_path}/Aseprite.app/Contents/MacOS/aseprite"

    FileUtils.rm_r "#{staged_path}/Aseprite.app/Contents/Resources/data"
    FileUtils.ln_s "#{Formula["aseprite"].share}/aseprite/data", "#{staged_path}/Aseprite.app/Contents/Resources/data"
  end

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Preferences/aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]

  caveats do
    license "https://github.com/aseprite/aseprite/blob/v#{version}/EULA.txt"
  end
end
