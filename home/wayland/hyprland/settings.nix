_: {
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      monitor = [
        "HDMI-A-1,1920x1080@60, 3640x560, 1, transform, 3" #right
        "DP-1,1920x1080@60, 0x560, 1, transform, 1" #left
        "DP-2,2560x1440@144, 1080x1080, 1" #middle
        "DP-3,1920x1080@144, 1400x0, auto" #top
      ];
      exec-once = [
        "swww init"
        "/nix/store/gjbi20m2wz9xhm18ifmcdl45cpgd7hpz-polkit-gnome-0.105/libexec/polkit-gnome-authentication-agent-1"
        "~/.local/bin/lock"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = "-0.5";
        force_no_accel = true;
      };
      general = {
        gaps_in = 6;
        gaps_out = 15;
        border_size = 4;
        "col.active_border" = "rgb(f5c2e7)";
        "col.inactive_border" = "rgb(6c7086)";
        layout = "dwindle";
      };
      decoration = {
        rounding = 8;
        blur = true;
        blur_size = 5;
        blur_passes = 3;
        blur_new_optimizations = true;
        multisample_edges = true;
        inactive_opacity = 1;
        active_opacity = 1;
        fullscreen_opacity = 1;
        drop_shadow = true;
        shadow_range = 60;
        shadow_offset = "0 5";
        shadow_render_power = 4;
        "col.shadow" = "rgba(00000099)";
      };

      animations = {
        enabled = true;
        animation = [
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
      };
      "device:epic mouse V1" = {
        sensitivity = "-0.5";
      };
      windowrulev2 = [
        "noshadow, floating:0"
        "float, title:^(Volume Control)$"
        "float, title:^(Picture in Picture)$"
        "float, title:^(Steam)$"
        "float, title:^(Friends List)$"
        "float, title:^(Cryptomator)$"
        "float, title:^(wlogout)$"
        "float, title:^(RuneLite)"
        "move 850 360, title:^(RuneLite)"
        "size 830 600, title:^(RuneLite)"
      ];
      bindm = [
        "$mod, mouse_down, workspace e+1"
        "$mod, mouse_up, workspace e-1"
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bind = [
        "$mod, Return, exec, wezterm"
        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, R, exec, rofi -modi run -show drun"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 10, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 10, movetoworkspace, 10"
      ];
    };
    extraConfig = ''
      bind =, Print, exec, grim -g "$(slurp)" - | swappy -f -
    '';
  };
}
