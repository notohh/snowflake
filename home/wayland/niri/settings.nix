{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.niri.settings = {
    ### monitors
    outputs = {
      # right
      "HDMI-A-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = {
          x = 3640;
          y = 560;
        };
        transform.rotation = 270;
        scale = 1;
      };
      # middle
      "DP-1" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 164.958;
        };
        position = {
          x = 1080;
          y = 1080;
        };
        scale = 1;
      };
      # top
      "DP-2" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 144.001;
        };
        position = {
          x = 1400;
          y = 0;
        };
        scale = 1;
      };
      # left
      "DP-3" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = {
          x = 0;
          y = 560;
        };
        transform.rotation = 90;
        scale = 1;
      };
    };

    ### autoexec
    spawn-at-startup =
      let
        inherit (pkgs.stdenv.hostPlatform) system;
        inherit (inputs.awww.packages.${system}) awww;
      in
      [
        {
          sh = "chatterino";
        }
        {
          sh = "${awww}/bin/awww-daemon";
        }
        {
          sh = "streamcontroller -b";
        }
        {
          sh = "music-discord-rpc";
        }
        {
          sh = "noctalia-shell";
        }
      ];

    ### misc settings
    prefer-no-csd = true;
    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite;
    };
    layout = {
      border.enable = false;
      focus-ring.enable = false;
      shadow.enable = false;
      always-center-single-column = false;
      background-color = "transparent";
      default-column-width = {
        proportion = 0.5;
      };
    };
    input = {
      focus-follows-mouse.enable = false;
      mouse = {
        enable = true;
        accel-profile = "flat";
      };
    };
    gestures = {
      hot-corners.enable = false;
    };
    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = false;
    };

    ### binds
    binds =
      let
        noctalia-pkg = config.programs.noctalia-shell.package;
        inherit (config.lib.niri.actions)
          spawn
          spawn-sh
          close-window
          fullscreen-window
          toggle-overview
          focus-column-right
          focus-column-left
          toggle-window-floating
          maximize-window-to-edges
          focus-workspace-up
          focus-workspace-down
          move-window-to-workspace-up
          move-window-to-workspace-down
          move-column-left
          move-column-right
          ;
      in
      {
        # default acts
        "Mod+Q".action = close-window;
        "Mod+F".action = fullscreen-window;
        "Mod+Escape".action = toggle-overview;
        "Mod+WheelScrollUp".action = focus-column-right;
        "Mod+WheelScrollDown".action = focus-column-left;
        "Mod+V".action = toggle-window-floating;
        "Mod+M".action = maximize-window-to-edges;

        # workspace movement
        "Mod+K".action = focus-workspace-up;
        "Mod+J".action = focus-workspace-down;
        "Mod+Shift+K".action = move-window-to-workspace-up;
        "Mod+Shift+J".action = move-window-to-workspace-down;
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;

        # spawn acts
        "Mod+Tab".action = spawn "wayscriber" "-a";
        "Mod+Return".action = spawn "ghostty";
        "Mod+C".action = spawn-sh "${lib.getExe pkgs.hyprpicker} | wl-copy";
        "Mod+Shift+R".action =
          spawn-sh ''gpu-screen-recorder -w DP-1 -f 60 -r 60 -c mp4 -a "default_output|default_input" -o ~/Videos/replays & sleep 2 && ${lib.getExe noctalia-pkg} ipc call toast send '{"title": "Replay buffer started", "body": "Started GSR process"}' || ${lib.getExe noctalia-pkg} ipc call toast send '{"title": "Replay buffer failed", "body": "Replay buffer failed to start"' '';
        "Mod+Shift+S".action =
          spawn-sh ''killall -SIGUSR1 gpu-screen-recorder && ${lib.getExe noctalia-pkg} ipc call toast send '{"title": "Replay saved", "body": "Replay buffer dumped"}' || ${lib.getExe noctalia-pkg} ipc call toast send '{"title": "Failed to save replay", "body": "Replay buffer failed to dump (is the GSR process running?)"}' '';
        "Mod+Ctrl+R".action =
          spawn-sh ''killall -SIGINT gpu-screen-recorder && ${lib.getExe noctalia-pkg} ipc call toast send '{"title": "GSR killed", "body": "Killed GSR process"}' || ${lib.getExe noctalia-pkg} ipc call toast send '{"title": "GSR process failed to die", "body": "Failed to kill GSR process (is it running?)"}' '';
        "Print".action =
          with pkgs;
          with lib;
          spawn-sh ''${getExe grim} -g "$(${getExe slurp})" - | ${getExe satty} -f - --fullscreen --output-filename ~/Pictures/screenshots/$(date '+%Y%m%d-%H:%M:%S').png'';
        "Mod+R".action = spawn-sh "${lib.getExe noctalia-pkg} ipc call launcher toggle";
      };
    ### window rules
    window-rules = [
      {
        matches = [ { app-id = "net-runelite-client-RuneLite"; } ];
        open-floating = true;
      }
      {
        matches = [ { app-id = "discord"; } ];
        open-on-output = "DP-3";
        open-maximized = true;
      }
      {
        matches = [ { app-id = "com.chatterino."; } ];
        open-on-output = "HDMI-A-1";
        open-maximized = true;
      }
      {
        matches = [ { app-id = "zen-beta"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "spotify"; } ];
        open-maximized = true;
      }
      {
        matches = [ { app-id = "com.gabm.satty"; } ];
        open-floating = true;
      }
      {
        matches = [ { app-id = "^(steam_app_)(.*)$"; } ];
        open-on-output = "DP-1";
        open-fullscreen = true;
      }
      {
        matches = [ { app-id = "gamescope"; } ];
        open-on-output = "DP-1";
      }
      {
        geometry-corner-radius =
          let
            r = 12.0;
          in
          {
            bottom-right = r;
            bottom-left = r;
            top-right = r;
            top-left = r;
          };
        clip-to-geometry = true;
      }
    ];
    ### layer rules
    layer-rules = [
      {
        matches = [ { namespace = "awww-daemon"; } ];
        place-within-backdrop = true;
      }
    ];
  };
}
