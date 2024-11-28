class Aseprite < Formula
  desc "Animated sprite editor & pixel art tool"
  homepage "https://www.aseprite.org"
  url "https://github.com/aseprite/aseprite/releases/download/v1.3.9.1/Aseprite-v1.3.9.1-Source.zip"
  sha256 "c4abfc90abcabd2971704d0b57abcf183e48c8932c11998c59122a491e2c686c"
  license :cannot_represent

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on xcode: ["13.1", :build]
  depends_on macos: :big_sur

  resource "skia" do
    url "https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-macOS-Release-arm64.zip"
    sha256 "3eac3a0a5792a38e1b21a429b359316cfbe402d77795861a3d40d52c1a8cb8cd"
  end

  patch :DATA

  def install
    resource("skia").stage { cp_r ".", "#{buildpath}/skia" }

    mkdir "build"

    cd "build" do
      system "cmake",
        "-DCMAKE_OSX_ARCHITECTURES=arm64",
        "-DCMAKE_OSX_DEPLOYMENT_TARGET=11.0",
        "-DCMAKE_OSX_SYSROOT=" \
        "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk",
        "-DLAF_BACKEND=skia",
        "-DSKIA_DIR=../skia",
        "-DSKIA_LIBRARY_DIR=../skia/out/Release-arm64",
        "-DSKIA_LIBRARY=../skia/out/Release-arm64/libskia.a",
        "-DPNG_ARM_NEON:STRING=on",
        "-G Ninja",
        "..",
        *std_cmake_args
      system "ninja", "aseprite"
      system "ninja", "install"
    end
  end

  test do
    assert_equal "Aseprite 1.3.9.1-dev", shell_output("#{bin}/aseprite --version").strip
  end
end
__END__
diff --git a/src/app/resource_finder.cpp b/src/app/resource_finder.cpp
index 3a3126c6c..7a2452fa4 100644
--- a/src/app/resource_finder.cpp
+++ b/src/app/resource_finder.cpp
@@ -102,6 +102,9 @@ void ResourceFinder::includeDataDir(const char* filename)
   std::snprintf(buf, sizeof(buf), "../Resources/data/%s", filename);
   includeBinDir(buf);  // $BINDIR/../Resources/data/filename (inside a bundle)

+  std::snprintf(buf, sizeof(buf), "../share/aseprite/data/%s", filename);
+  includeBinDir(buf);  // $BINDIR/../share/aseprite/data/filename (installed in /usr/ or /usr/local/)
+
 #else

   // $HOME/.config/aseprite/filename
