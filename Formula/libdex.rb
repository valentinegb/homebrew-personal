class Libdex < Formula
  desc "Provides Future-based programming for GLib-based applications"
  homepage "https://gitlab.gnome.org/GNOME/libdex"
  license "LGPL-2.1-or-later"
  head "https://gitlab.gnome.org/GNOME/libdex.git", branch: "main"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "vala" => :build
  depends_on "glib"
  depends_on "gobject-introspection"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libdex`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
