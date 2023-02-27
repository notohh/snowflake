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
  ./lf
];
 systemd.user.startServices = "sd-switch";
 programs.home-manager.enable = true;

  home = {
    username = "oh";
    homeDirectory = "/home/oh";
    stateVersion = "23.05";
  };

}