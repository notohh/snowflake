{
  stdenv,
  lib,
  cmake,
  pkg-config,
  fetchFromGitHub,
  qtbase,
  qtsvg,
  qtmultimedia,
  qtimageformats,
  qttools,
  boost,
  openssl,
  wrapQtAppsHook,
  libsecret,
}:
stdenv.mkDerivation rec {
  pname = "chatterino7";
  version = "7.4.6";

  src = fetchFromGitHub {
    owner = "SevenTV";
    repo = pname;
    rev = "1132751f4ba4ae7306e0defd01fbaa467bbdb528";
    sha256 = "sha256-/b1+4v09nDiATJlziedY/1S6Zq1iq45PPh37cwxznMQ=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [cmake pkg-config wrapQtAppsHook];
  buildInputs = [qtbase qtsvg qtmultimedia qtimageformats qttools boost openssl libsecret];

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
