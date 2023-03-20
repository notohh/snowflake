{
  config,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''

monitor=HDMI-A-1,1920x1080,5760x0,1
monitor=DP-2,1920x1080,1920x0,1
monitor=DP-3,1920x1080@144,3840x0,1

exec-once = waybar & dunst

# SWWW
exec-once=swww init

# swayidle / lock
exec-once=~/.local/bin/lock

input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = -0.5 # -1.0 - 1.0, 0 means no modification.
    force_no_accel = true
}

general {

    gaps_in = 6
    gaps_out = 20
    border_size = 4
    col.active_border = rgb(f5c2e7)
    col.inactive_border = rgb(6c7086)

    layout = dwindle
}

decoration {

    rounding = 8
    blur = yes
    blur_size = 4
    blur_passes = 2
    blur_new_optimizations = on
    multisample_edges = true
    inactive_opacity = 0.9

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    

    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    new_is_master = true
}

gestures {
    workspace_swipe = off
}

device:epic mouse V1 {
    sensitivity = -0.5
}

$mainMod = SUPER

bind = $mainMod, Return, exec, wezterm
bind = $mainMod, Q, killactive, 
bind = $mainMod, V, togglefloating, 
bind = $mainMod, R, exec, rofi -modi run -show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind =, Print, exec, grim -g "$(slurp -d)" | wl-copy

bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=/nix/store/gjbi20m2wz9xhm18ifmcdl45cpgd7hpz-polkit-gnome-0.105/libexec/polkit-gnome-authentication-agent-1
exec-once=/nix/store/wv4rwqbxvpfn73zh2ma1asdf9f0mpaan-xdg-desktop-portal-hyprland-0.pre+date=2022-12-05_af840a9/libexec/xdg-desktop-portal-hyprland

  '';
}
