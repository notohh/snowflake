{
  stdenv,
  cmake,
  pkgs,
  lib,
  makeDesktopItem,
}:
stdenv.mkDerivation rec {
  pname = "chatterino7";
  version = "7.4.5";
  src = pkgs.fetchFromGitHub {
    owner = "SevenTV";
    repo = pname;
    rev = "97bc0d8efdfcb5fa02719d6e126d4fbfa86cbc35";
    sha256 = "sha256-/uv1shCCimkzshtch/tXoJQ9TkUIvTCn8nmFqpj0qz0=";
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
      cp "bin/chatterino" "$out/bin"
    ''
    + ''
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp $src/resources/icon.png $out/share/icons/hicolor/256x256/apps/chatterino.png
    '';
  postFixup = ''
    mkdir -p $out/share/applications
    ln -s ${desktopFile}/share/applications/* $out/share/applications
  '';
  desktopFile = makeDesktopItem {
    name = "Chatterino7";
    desktopName = "Chatterino7";
    exec = "chatterino";
    icon = "chatterino";
    comment = meta.description;
  };
  meta = with lib; {
    description = "Chat client for twitch.tv";
    homepage = "https://github.com/SevenTV/chatterino7";
    license = licenses.mit;
    maintainers = with maintainers; [notohh];
  };
}
