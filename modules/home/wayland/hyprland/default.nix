{
  default,
  pkgs,
  ...
}: {
  imports = [./config.nix];
  
  wayland.windowManager.hyprland = {
    enable = true;
  };
}