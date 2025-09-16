{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = false;
    package = inputs.hyprlock.packages.${pkgs.system}.default;
    settings = {
      background = let
        verticalWallpaper = "/home/notoh/dev/assets/wallpapers/miku/miku2.png";
        horizontalWallpaper = "/home/notoh/dev/assets/wallpapers/miku/miku.png";
      in [
        {
          monitor = "HDMI-A-1";
          path = verticalWallpaper;
          blur_passes = 3;
          blur_size = 4;
          brightness = 0.5;
        }
        {
          monitor = "DP-3";
          path = verticalWallpaper;
          blur_passes = 3;
          blur_size = 4;
          brightness = 0.5;
        }
        {
          monitor = "DP-1";
          path = horizontalWallpaper;
          blur_passes = 3;
          blur_size = 4;
          brightness = 0.5;
        }
        {
          monitor = "DP-2";
          path = horizontalWallpaper;
          blur_passes = 3;
          blur_size = 4;
          brightness = 0.5;
        }
      ];
      general = {
        disable_loading_bar = false;
        hide_cursor = false;
        no_fade_in = false;
        ignore_empty_input = true;
      };
      animations = {
        enabled = true;
      };
      input-field = [
        {
          monitor = "DP-1";
          size = "350, 50";
          outline_thickness = 2;
          outer_color = "rgb(f5c2e7)";
          inner_color = "rgb(1a1b26)";
          font_color = "rgb(c0caf5)";
          fail_color = "rgb(f7768e)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          check_color = "rgb(ff9e64)";
          swap_font_color = false;
          placeholder_text = ''
            <i><span foreground="##c0caf5">Password...</span></i>
          '';
          fade_on_empty = false;
          dots_spacing = 0.5;
          dots_center = true;
          shadow_passes = 3;
          shadow_size = 1;
          shadow_color = "rgba(00000099)";
          shadow_boost = 1.0;
        }
      ];
      label = [
        {
          monitor = "DP-1";
          text = ''
            Hi, <i><span foreground="##74c7ec">$USER</span></i>
          '';
          color = "rgb(c0caf5)";
          position = "0, 60";
          valign = "center";
          halign = "center";
          shadow_passes = 3;
          shadow_size = 1;
          shadow_color = "rgba(00000099)";
          shadow_boost = 1.0;
        }
        {
          monitor = "DP-1";
          text = "$TIME";
          color = "rgb(c0caf5)";
          position = "0, 120";
          valign = "center";
          halign = "center";
          shadow_passes = 3;
          shadow_size = 1;
          shadow_color = "rgba(00000099)";
          shadow_boost = 0.6;
        }
      ];
    };
  };
}
