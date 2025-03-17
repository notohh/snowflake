{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [pkgs.hyprpaper];

  services.hyprpaper = let
    verticalWallpaper = "~/dev/assets/wallpapers/miku/miku2.png";
    horizontalWallpaper = "~/dev/assets/wallpapers/miku/miku.png";
  in {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    settings = {
      ipc = true;
      splash = false;
      preload = [
        verticalWallpaper
        horizontalWallpaper
      ];
      wallpaper = [
        "HDMI-A-1,${verticalWallpaper}"
        "DP-1,${horizontalWallpaper}"
        "DP-2,${horizontalWallpaper}"
        "DP-3,${verticalWallpaper}"
      ];
    };
  };
}
