{config, pkgs, ...}:

{

imports = [
  ./gtk/default.nix
];

 programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    stateVersion = "23.05";
  };

}