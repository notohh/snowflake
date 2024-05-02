{
  stdenv,
  lib,
  cmake,
  pkg-config,
  fetchFromGitHub,
  qt6,
  boost,
  openssl,
  libsecret,
}:
stdenv.mkDerivation rec {
  pname = "chatterino7";
  version = "7.5.1";

  src = fetchFromGitHub {
    owner = "SevenTV";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-T0H+p9hyNd73gETwLilXN0uzcF75TJgx/LzHqnC099M=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [cmake pkg-config qt6.wrapQtAppsHook];
  buildInputs = [
    qt6.qtbase
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qttools
    qt6.qt5compat
    qt6.qtwayland
    boost
    openssl
    libsecret
  ];
  cmakeFlags = ["-DBUILD_WITH_QT6=ON"];
  postInstall =
    ''
      mkdir -p "$out/bin"
      cp "bin/chatterino" "$out/bin"
    ''
    + ''
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp $src/resources/icon.png $out/share/icons/hicolor/256x256/apps/chatterino.png
    '';
  meta = with lib; {
    description = "Chat client for twitch.tv";
    mainProgram = "chatterino";
    longDescription = ''
      Chatterino7 is a fork of Chatterino 2.
      This fork mainly contains features that aren't accepted into Chatterino 2,
      most notably 7TV subscriber features.
    '';
    homepage = "https://github.com/SevenTV/chatterino7";
    license = licenses.mit;
    maintainers = with maintainers; [notohh];
  };
}
