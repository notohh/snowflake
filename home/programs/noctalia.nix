{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      wallpaper.enabled = false;
      general = {
        avatarImage = "/home/notoh/dev/assets/pfps/mahoyo/alice-cropped-1.png";
      };
      location = {
        monthBeforeDay = true;
        name = "New York";
      };
      colorSchemes = {
        darkMode = true;
        predefinedScheme = "Rosey AMOLED";
      };
      notifications = {
        enabled = true;
        monitors = [ "DP-1" ];
      };
      bar = {
        density = "spacious";
        barType = "simple";
        position = "top";
        showOutline = false;
        showCapsule = true;
        monitors = "DP-1";
        backgroundOpacity = 1;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Spacer";
            }
            {
              id = "Workspace";
              hideUnoccupied = false;
              labelMode = "none";
            }
          ];
          center = [
            {
              id = "MediaMini";
              hideWhenIdle = false;
              maxWidth = 240;
              useFixedWidth = true;
              showVisualizer = true;
              visualizerType = "mirrored";
              showAlbumArt = true;
              showProgressRing = true;
            }
          ];
          right = [
            {
              id = "SystemMonitor";
            }
            {

              id = "Clock";
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Tray";
            }
          ];
        };
      };
      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };
    };
  };
}
