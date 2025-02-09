{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprpanel.settings = {
    bar = {
      autoHide = "fullscreen";
      launcher.autoDetectIcon = true;
      clock = {
        format = "%m/%d/%y  %H:%M";
      };
      media = {
        truncation = true;
        truncation_size = 40;
      };
      workspaces = {
        workspaces = 4;
        show_icons = true;
        showWsIcons = false;
        showApplicationIcons = false;
        monitorSpecific = false;
      };
      customModules = {
        hyprsunset = {
          temperature = "3000k";
        };
        weather.unit = "metric";
      };
    };
    notifications = {
      monitor = 0;
      active_monitor = false;
    };
    menus = {
      clock = {
        time = {
          military = true;
          hideSeconds = false;
        };
        weather = {
          enabled = false;
          key = "13b77bbcf0dc420782005246250902";
          unit = "metric";
          location = "New York";
        };
      };
      media = {
        displayTime = true;
      };
      dashboard = {
        stats.enable_gpu = false;
        directories.enabled = false;
        shortcuts.enabled = false;
        powermenu = {
          sleep = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms off";
          avatar = {
            image = "/home/notoh/dev/assets/pfps/pfp2.jpg";
            name = "notohh";
          };
        };
      };
    };
    theme = {
      bar.transparent = false;
      osd = {
        monitor = 0;
        active_monitor = false;
      };
      font = {
        name = "Inter";
        size = "17px";
      };
    };
  };
}
