class Radicle < Formula
  desc "Decentralized Git code forge"
  homepage "https://radicle.xyz"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://seed.radicle.xyz/z3gqcJUoA1n9HaHKufZs5FCSGazv5.git",
       branch: "master"

  depends_on "rust" => :build
  depends_on "openssh"

  def install
    system "cargo", "install", "--jobs", "8", "--locked", "--root=#{prefix}",
      "radicle-cli", "radicle-node", "radicle-remote-helper"
  end

  test do
    assert_equal "rad pre-release (unknown)", shell_output("rad --version").strip
  end
end
