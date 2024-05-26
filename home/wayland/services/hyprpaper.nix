{pkgs, ...}: {
  home.packages = [pkgs.hyprpaper];

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      splash = false;
      preload = [
        "~/Pictures/wallpapers/sparkle3.png"
        "~/Pictures/wallpapers/sparkle4.png"
      ];
      wallpaper = [
        "HDMI-A-1,~/Pictures/wallpapers/sparkle3.png"
        "DP-1,~/Pictures/wallpapers/sparkle4.png"
        "DP-2,~/Pictures/wallpapers/sparkle4.png"
        "DP-3,~/Pictures/wallpapers/sparkle3.png"
      ];
    };
  };
}
