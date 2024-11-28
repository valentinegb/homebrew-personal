class Tuba < Formula
  desc "Fediverse client"
  homepage "https://tuba.geopjr.dev/"
  url "https://github.com/GeopJr/Tuba/archive/refs/tags/v0.7.2.tar.gz"
  sha256 "ffe81e9c1c45d1165327c61bf8fe7907695e94122bf3b72fc060f87f3611bdcf"
  license "GPL-3.0-only"

  head "https://github.com/GeopJr/Tuba.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "vala" => :build
  depends_on "adwaita-icon-theme"
  depends_on "glib"
  depends_on "gtksourceview5"
  depends_on "json-glib"
  depends_on "libadwaita"
  depends_on "libgee"
  depends_on "libsecret"
  depends_on "libsoup"

  def install
    system "meson", "setup", "build", "-Ddistro=true", *std_meson_args
    system "meson", "configure", "build", "-Ddevel=#{build.head?}"
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def post_install
    system "glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
    system "gtk4-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
  end

  test do
    system "#{bin}/dev.geopjr.Tuba", "--help"
  end
end
