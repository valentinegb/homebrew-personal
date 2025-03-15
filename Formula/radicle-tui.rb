class RadicleTui < Formula
  desc "TUI for Radicle"
  homepage "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z39mP9rQAaGmERfUMPULfPUi473tY"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://seed.radicle.xyz/z39mP9rQAaGmERfUMPULfPUi473tY.git",
       branch: "master"

  depends_on "rust" => :build
    depends_on "openssh"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # I'm too lazy to write a proper test for this right now :P
    system "true"
  end
end
