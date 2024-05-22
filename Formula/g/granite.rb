class Granite < Formula
  desc "Library that extends GTK with common widgets and utilities"
  homepage "https://github.com/elementary/granite"
  url "https://github.com/elementary/granite/archive/refs/tags/7.5.0.tar.gz"
  sha256 "9439733169c07cfc658144ceef90bebac5f024ffda4bbb65e8c1ab68e5580908"
  license "LGPL-3.0-or-later"

  depends_on "gobject-introspection" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "sassc" => :build
  depends_on "vala" => :build
  depends_on "cairo"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "fribidi"
  depends_on "gdk-pixbuf"
  depends_on "gettext"
  depends_on "glib"
  depends_on "graphene"
  depends_on "graphite2"
  depends_on "gsettings-desktop-schemas"
  depends_on "gtk4"
  depends_on "harfbuzz"
  depends_on "jpeg-turbo"
  depends_on "libgee"
  depends_on "libpng"
  depends_on "libx11"
  depends_on "libxau"
  depends_on "libxcb"
  depends_on "libxdmcp"
  depends_on "libxext"
  depends_on "libxrender"
  depends_on "pango"
  depends_on "pixman"
  depends_on "xorgproto"

  def install
    system "meson", "setup", "build", *std_meson_args
    cd "build" do
      system "ninja"
      system "ninja", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test granite`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
