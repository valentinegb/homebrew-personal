class Radicle < Formula
  desc "Decentralized Git code forge"
  homepage "https://radicle.xyz"
  url "https://seed.radicle.xyz/z3gqcJUoA1n9HaHKufZs5FCSGazv5.git",
      revision: "70f0cc354dee34fc5efaa593a4166872f4089097"
  version "1.1.0"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://seed.radicle.xyz/z3gqcJUoA1n9HaHKufZs5FCSGazv5.git",
       branch: "master"

  livecheck do
    url "https://files.radicle.xyz/releases/latest/radicle.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "rust" => :build
  depends_on "openssh"

  def install
    unless build.head?
      ENV["RADICLE_VERSION"] = version
      ENV["GIT_HEAD"] = "70f0cc354dee34fc5efaa593a4166872f4089097"
    end

    system "cargo", "install", "--jobs", "8", "--locked", "--root=#{prefix}",
      "radicle-cli", "radicle-node", "radicle-remote-helper"
  end

  test do
    assert_match "Current directory is not a Radicle repository", shell_output("#{bin}/rad inspect", 1)
  end
end
