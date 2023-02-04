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
  ./lazygit
  ./lf
  ./waybar
  ./wayland/hyprland
];
 systemd.user.startServices = "sd-switch";
 programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    stateVersion = "23.05";
  };

}