{config, pkgs, ...}:

{

imports = [
  ./gtk/gtk.nix
  ./wezterm/wezterm.nix
  ./zathura/zathura.nix
  ./nushell/nushell.nix
  ./starship/starship.nix
  ./dunst/dunst.nix
  ./helix/helix.nix
  ./git/git.nix
];
 systemd.user.startServices = "sd-switch";
 programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    stateVersion = "23.05";
  };

}