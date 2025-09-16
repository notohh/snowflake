{
  pkgs,
  osConfig,
  ...
}:
{
  programs.lutris = {
    enable = true;
    extraPackages = with pkgs; [
      mangohud
      wine-staging
      winetricks
      umu-launcher
    ];
    protonPackages = [
      pkgs.proton-ge-bin
    ];
    steamPackage = osConfig.programs.steam.package;
  };
}
