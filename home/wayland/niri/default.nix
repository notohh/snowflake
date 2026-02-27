{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./settings.nix
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
