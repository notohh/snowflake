{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [pkgs.hyprpaper];
  imports = [inputs.hyprpaper.homeManagerModules.default];
  disabledModules = ["${inputs.home-manager}/modules/services/hyprpaper.nix"];

  services.hyprpaper = {
    enable = true;
    ipc = true;
    splash = false;
    preloads = [
      "~/Pictures/wallpapers/sparkle3.png"
      "~/Pictures/wallpapers/sparkle4.png"
    ];
    wallpapers = [
      "HDMI-A-1,~/Pictures/wallpapers/sparkle3.png"
      "DP-1,~/Pictures/wallpapers/sparkle4.png"
      "DP-2,~/Pictures/wallpapers/sparkle4.png"
      "DP-3,~/Pictures/wallpapers/sparkle3.png"
    ];
  };
}
