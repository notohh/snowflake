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
  programs.ironbar = {
    enable = true;
    systemd = true;
    style = builtins.readFile (compileSCSS "style" ./style.scss);
    config = let
      nixlogo = {
        type = "custom";
        bar = [
          {
            type = "image";
            src = "https://files.artturin.com/files/nixoscolorful.svg";
            size = 24;
          }
        ];
      };
      pfp = {
        type = "custom";
        bar = [
          {
            type = "image";
            src = "https://img.notohh.dev/JoYRnUdM.png";
            size = 24;
          }
        ];
      };
      uptime = {
        type = "sys_info";
        format = ["{uptime}"];
      };
      focused = {
        type = "focused";
        show_icon = true;
        icon_size = 24;
        truncate = {
          mode = "end";
          length = 12;
        };
      };
      sys-info = {
        type = "sys_info";
        format = [
          "{cpu_percent}% 󰍛 "
          "{memory_percent}%  "
          "{net_up:enp2s0}  {net_down:enp2s0}"
        ];
      };
      tray = {type = "tray";};
      clock = {type = "clock";};
    in {
      monitors = {
        "DP-3" = {
          position = "top";
          anchor_to_edges = true;
          start = [nixlogo];
          center = [focused];
          end = [sys-info clock];
        };
      };
    };
  };
}
