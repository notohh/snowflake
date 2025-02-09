_: {
  programs.hyprpanel.settings = {
    bar = {
      launcher.autoDetectIcon = true;
      workspaces = {
        show_icons = true;
      };
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
      font = {
        name = "Inter";
        size = "17px";
      };
    };
  };
}
