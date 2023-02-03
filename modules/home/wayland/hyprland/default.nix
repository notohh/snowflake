{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [./config.nix];
  
  wayland.windowManager.hyprland.enable = true;
}