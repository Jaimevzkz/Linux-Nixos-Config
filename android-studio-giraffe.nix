{ pkgs }:
pkgs.buildFHSEnv {
  name = "android-studio-giraffe";
  targetPkgs = pkgs: [
    pkgs.glibc
    pkgs.libGL
    pkgs.libGLU
    pkgs.xorg.libX11
    pkgs.xorg.libXtst
    pkgs.xorg.libXrender
    pkgs.xorg.libXrandr
    pkgs.xorg.libXext
    pkgs.xorg.libXinerama
    pkgs.xorg.libXcursor
    pkgs.xorg.libXScrnSaver
    pkgs.alsa-lib
    pkgs.freetype
    pkgs.gtk3
    pkgs.glib
    pkgs.zlib
    pkgs.xorg.libxcb
    pkgs.xorg.libXi
  ];
  runScript = ''
    ${pkgs.stdenv.mkDerivation {
      pname = "android-studio-giraffe";
      version = "2022.3.1";

      src = pkgs.fetchurl {
        url = "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.3.1.17/android-studio-2022.3.1.17-linux.tar.gz";
        sha256 = "069babf72b62c1ad2e762c9857195f2d3e0cf9970ee5ab5051083f168ac04cfe";
      };

      buildInputs = [ pkgs.glibc ];

      unpackPhase = "tar xzf $src --strip-components=1";

      installPhase = ''
        mkdir -p $out/bin
        cp -r * $out
        ln -s $out/bin/studio.sh $out/bin/android-studio-giraffe
      '';

      meta = with pkgs.lib; {
        description = "Android Studio Giraffe 2022.3.1 IDE for Android Development";
        homepage = "https://developer.android.com/studio";
        license = licenses.asl20;
      };
    }}/bin/studio.sh
  '';
}
