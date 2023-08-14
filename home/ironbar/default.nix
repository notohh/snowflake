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
      nixlogo = rec {
        type = "custom";
        name = "nixlogo";
        class = name;
        bar = [
          {
            type = "image";
            src = "https://files.artturin.com/files/nixoscolorful.svg";
            size = 24;
          }
        ];
      };
      pfp = rec {
        type = "custom";
        name = "pfp";
        class = name;
        bar = [
          {
            type = "image";
            src = "https://img.notohh.dev/JoYRnUdM.png";
            size = 24;
          }
        ];
      };
      music = {
        type = "music";
        player_type = "mpris";
        format = "{title} - {artist}";
        show_status_icon = false;
        icons.play = "";
        icons.pause = "";
        truncate = {
          mode = "end";
          max_length = 36;
        };
      };
      music_img = rec {
        type = "custom";
        name = "music-img";
        class = name;
        bar = [
          {
            type = "image";
            class = name + "-img";
            src = ''{{poll:2000:playerctl metadata mpris:artUrl}}'';
          }
        ];
      };
      spacer = {
        type = "label";
        label = "|";
      };
      focused = {
        type = "focused";
        show_icon = true;
        icon_size = 24;
        truncate = {
          mode = "end";
          max_length = 24;
        };
      };
      uptime = rec {
        type = "sys_info";
        name = "uptime";
        class = name;
        format = ["   {uptime}"];
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
        "DP-2" = {
          position = "top";
          anchor_to_edges = true;
          start = [nixlogo];
          center = [music spacer focused spacer uptime];
          end = [sys-info clock tray];
        };
      };
    };
  };
}
