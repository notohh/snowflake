{
  inputs,
  pkgs,
  lib,
  ...
}:
  let  
  compileSCSS = name: source: "${pkgs.runCommandLocal name {} ''
    mkdir -p $out
    ${lib.getExe pkgs.sassc} -t expanded '${source}' > $out/${name}.css
  ''}/${name}.css";
 in {
  programs.waybar = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
    settings = {
      mainBar = {
        output = "DP-3";
        layer = "top";
        position = "top";
        height = 35;
        width = 1880;
        spacing = 10;
        margin-top = 8;
        modules-left = [
         "image/nixos"
         "user"
         "wlr/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "cpu"
          "memory"
          "clock"
          "tray"
          "custom/wlogout"
        ];
        "image/nixos" = {
          path = "/home/notoh/snowflake/home/waybar/assets/nixos.png";
          size = 24;
          };
        "user" = {
          format = "{user} up {work_d} days | {work_H} hrs | {work_M} min ↑";
          interval = 60;
          icon = false;
        };
        "hyprland/window" = {
          format = " {}";
          seperate-outputs = true;
          max-length = 35;
        };
        "wlr/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          all-outputs = true;
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
          };
        };
        "cpu" = {
          format = "{usage}% ";
          tooltip = "false";
          interval = "2";
        };
        "memory" = {
          format = "{}% ";
          interval = "15";
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        "tray" = {
          spacing = 0;
        };
        "custom/wlogout" = {
          format = "";
          interval = "once";
          on-click = "wlogout -c 5 -r 5";
          tooltip = "false";
        };
      };
    };
    style = builtins.readFile (compileSCSS "waybar-style" ./style.scss);
  };
}