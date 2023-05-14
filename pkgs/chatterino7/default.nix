{
  stdenv,
  cmake,
  pkgs,
}:
stdenv.mkDerivation rec {
  pname = "chatterino7";
  version = "7.4.4";
  src = pkgs.fetchFromGitHub {
    owner = "SevenTV";
    repo = pname;
    rev = "90ee0afdf92bf6a7b383fda446ebeb88e214048b";
    sha256 = "sha256-PNl130u7Oau6MMUb9TAWtI30i1mfcF6lM+PJWPSdEqE=";
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
