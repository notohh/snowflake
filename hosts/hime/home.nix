{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../home
  ];
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "notoh";
    homeDirectory = lib.mkDefault "/home/notoh";
    stateVersion = "23.05";
  };
}
