_: {
  services.hyprpaper = {
    enable = true;
    ipc = true;
    splash = false;
    preloads = ["~/Pictures/wallpapers/frieren.png"];
    wallpapers = [
      "HDMI-A-1,~/Pictures/wallpapers/frieren.png"
      "DP-1,~/Pictures/wallpapers/frieren.png"
      "DP-2,~/Pictures/wallpapers/frieren.png"
      "DP-3,~/Pictures/wallpapers/frieren.png"
    ];
  };
}
