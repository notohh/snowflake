{config, pkgs, ...}:

{

imports = [
  ./gtk
  ./wezterm
  ./zathura
  ./nushell
  ./starship
  ./dunst
  ./helix
  ./git
];
 systemd.user.startServices = "sd-switch";
 programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    stateVersion = "23.05";
  };

}