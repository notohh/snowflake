_: {
  programs.hyprlock = {
    enable = true;
    backgrounds = let
      wallpaperPath = "/home/notoh/Pictures/wallpapers/cweam.png";
    in [
      {
        monitor = "DP-1";
        path = wallpaperPath;
      }
      {
        monitor = "DP-2";
        path = wallpaperPath;
      }
      {
        monitor = "DP-3";
        path = wallpaperPath;
      }
      {
        monitor = "HDMI-A-1";
        path = wallpaperPath;
      }
    ];
    general = {
      disable_loading_bar = false;
      hide_cursor = false;
      no_fade_in = false;
    };
    input-fields = [
      {
        monitor = "DP-2";
        size = {
          width = 300;
          height = 50;
        };
        outline_thickness = 2;

        outer_color = "rgb(1e1e2e)";
        inner_color = "rgb(1e1e2e)";
        font_color = "rgb(cdd6f4)";
        placeholder_text = ''
          <span foreground="##cdd6f4">Password...</span>
        '';
        fade_on_empty = false;
        dots_spacing = 0.3;
        dots_center = true;
      }
    ];
    labels = [
      {
        monitor = "DP-2";
        text = "Hi, $USER";
        color = "rgb(1e1e2e)";
        valign = "center";
        halign = "center";
      }
      {
        monitor = "DP-2";
        text = "$TIME";
        color = "rgb(1e1e2e)";
        position = {
          x = 0;
          y = 120;
        };
        valign = "center";
        halign = "center";
      }
    ];
  };
}
