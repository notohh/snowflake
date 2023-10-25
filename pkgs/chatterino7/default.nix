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
    rev = "v${version}";
    sha256 = "sha256-WFmv15rZPnTFruoYpXHUBj1NduppNE3dt5S/ArWL1Wg=";
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
