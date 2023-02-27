{config, pkgs, ...}:

{

imports = [
  ../../modules/common.nix
];
 systemd.user.startServices = "sd-switch";
 programs.home-manager.enable = true;

  home = {
    username = "oh";
    homeDirectory = "/home/oh";
    stateVersion = "23.05";
  };

}