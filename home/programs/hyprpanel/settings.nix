_: {
  programs.hyprpanel.settings = {
    bar = {
      launcher.autoDetectIcon = true;
      clock = {
        format = "%a %b %d  %H:%M";
      };
      workspaces = {
        show_icons = true;
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
          hideSeconds = true;
        };
        weather = {
          enabled = true;
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
          avatar = {
            image = "";
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
