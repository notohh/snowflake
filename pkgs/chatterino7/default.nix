{
  stdenv,
  cmake,
  pkgs,
}:
stdenv.mkDerivation rec {
  pname = "chatterino7";
  version = "7.4.2";
  src = pkgs.fetchFromGitHub {
    owner = "SevenTV";
    repo = pname;
    rev = "b26b15354c61b6b0acb58a12031e84332d505b94";
    sha256 = "sha256-w87tzju0/TTot3fHbM0at5nBo+lnaZwIurpZTIbwQDI=";
    fetchSubmodules = true;
  };
  nativeBuildInputs = with pkgs; [cmake pkg-config libsForQt5.qt5.wrapQtAppsHook];
  buildInputs = with pkgs; [libsForQt5.qt5.qtbase libsForQt5.qt5.qtsvg libsForQt5.qt5.qtmultimedia libsForQt5.qt5.qtimageformats libsForQt5.qt5.qttools boost openssl libsecret];
  configurationPhase = ''
    mkdir build && cd build
    cmake ..
  '';
  buildPhase = ''
    make
  '';
  installPhase =
    ''
      mkdir -p "$out/bin"
      mv "bin/chatterino" "$out/bin"
    ''
    + ''
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp $src/resources/icon.png $out/share/icons/hicolor/256x256/apps/chatterino.png
    '';
}
