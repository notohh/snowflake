{
  pkgs,
  lib,
  ...
}: let
  compileSCSS = name: source: "${pkgs.runCommandLocal name {} ''
    mkdir -p $out
    ${lib.getExe pkgs.sassc} -t expanded '${source}' > $out/${name}.css
  ''}/${name}.css";
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["river/tags"];
        modules-center = ["river/window"];
        modules-right = ["cpu" "memory" "clock" "battery" "tray"];
      };
      "river/tags" = {
        num-tags = 5;
        tag-labels = ["" "" "" "" ""];
      };
      "river/window" = {
        format = "{}";
      };
      "cpu" = {
        interval = 10;
        format = "{}%";
        max-length = 10;
        tooltip = false;
      };
      "memory" = {
        interval = 10;
        format = "{}%";
        max-length = 10;
        tooltip = false;
      };
      "battery" = {
        format = "{capacity}%";
        interval = 60;
        tooltip = false;
      };
      "clock" = {
        interval = 60;
        format = "{:%H:%M}";
        max-length = 25;
        tooltip = false;
      };
      "tray" = {
        icon-size = 21;
        spacing = 5;
      };
    };
    style = builtins.readFile (compileSCSS "style" ./style.scss);
  };
}
