{
  fetchurl,
  appimageTools,
  makeDesktopItem,
  ...
}:
let
  pname = "Curseforge";
  version = "latest";
  icon = fetchurl {
    url = "https://upload.wikimedia.org/wikipedia/en/b/bd/Curse%2C_Inc_Logo.png";
    sha256 = "sha256-Pm5a29vn1pUz1qk8Lj4iaJt1g/K3Q6r/JjHx1FWEuE0=";
  };

  desktopItem = makeDesktopItem {
    inherit icon;
    desktopName = "Curseforge";
    name = pname;
    exec = pname;
  };
in

appimageTools.wrapType2 {
  inherit pname version;
  src = fetchurl {
    url = "https://curseforge.overwolf.com/downloads/curseforge-${version}-linux.AppImage";
    hash = "sha256-4DQZNlrJGY1gGAyqB74+vhhI9lCDPAEQrayhSX5G0Uc=";
  };

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    ln -s ${desktopItem}/share/applications/* $out/share/applications/
  '';

  meta = {
    description = "";
    mainProgram = "curseforge";
  };
}
