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

  home = lib.mkForce {
    username = "notoh";
    homeDirectory = "/home/notoh";
    stateVersion = "23.05";
  };
}
