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
      };
      "river/window" = {
        format = "{}";
      };
      "cpu" = {
        interval = 10;
        format = "{}%";
        max-length = 10;
      };
      "memory" = {
        interval = 10;
        format = "{}%";
        max-length = 10;
      };
      "battery" = {
        format = "{capacity}% {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        interval = 60;
      };
      "clock" = {
        interval = 60;
        format = "{:%H:%M}";
        max-length = 25;
      };
      "tray" = {
        icon-size = 21;
        spacing = 5;
      };
    };
    style = builtins.readFile (compileSCSS "style" ./style.scss);
  };
}
