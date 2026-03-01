{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        weather-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        catwalk = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
    };
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
      dock.enabled = false;
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
            {
              id = "ActiveWindow";
              maxWidth = 200;
              colorizeIcons = true;
            }
          ];
          center = [
            {
              id = "plugin:catwalk";
            }
            {
              id = "MediaMini";
              hideWhenIdle = false;
              maxWidth = 300;
              useFixedWidth = true;
              showVisualizer = true;
              visualizerType = "wave";
              showAlbumArt = true;
              showProgressRing = true;
              scrollingMode = "always";
            }
          ];
          right = [
            {
              id = "plugin:tailscale";
            }
            {
              id = "plugin:weather-indicator";
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
        cards = [
          {
            enabled = true;
            id = "profile-card";
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
