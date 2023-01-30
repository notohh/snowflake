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
    packages = [
      pkgs.alsa-lib
      pkgs.boost
      pkgs.qt5.full
      pkgs.openssl
    ];
  };

}