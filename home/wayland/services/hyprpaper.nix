_: {
  services.hyprpaper = {
    enable = true;
    ipc = true;
    splash = false;
    preloads = [
      "~/Pictures/wallpapers/sparkle.png"
      "~/Pictures/wallpapers/sparkle2.png"
    ];
    wallpapers = [
      "HDMI-A-1,~/Pictures/wallpapers/sparkle.png"
      "DP-1,~/Pictures/wallpapers/sparkle.png"
      "DP-2,~/Pictures/wallpapers/sparkle2.png"
      "DP-3,~/Pictures/wallpapers/sparkle2.png"
    ];
  };
}
