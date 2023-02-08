{
  config,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''

# Please note not all available settings / options are set here.
# For a full list, see the wiki

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=HDMI-A-1,1920x1080,5760x0,1
monitor=DP-2,1920x1080,1920x0,1
monitor=DP-3,1920x1080@144,3840x0,1

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = waybar & dunst

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
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
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 6
    gaps_out = 20i
    border_size = 4
    col.active_border = rgb(f5c2e7)
    col.inactive_border = rgb(6c7086)

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

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

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic mouse V1 {
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, wezterm
bind = $mainMod, Q, killactive, 
bind = $mainMod, V, togglefloating, 
bind = $mainMod, R, exec, rofi -modi run -show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind =, Print, exec, grim -g "$(slurp -d)" | wl-copy

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
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

# Move active window to a workspace with mainMod + SHIFT + [0-9]
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

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=/nix/store/gjbi20m2wz9xhm18ifmcdl45cpgd7hpz-polkit-gnome-0.105/libexec/polkit-gnome-authentication-agent-1
exec-once=/nix/store/wv4rwqbxvpfn73zh2ma1asdf9f0mpaan-xdg-desktop-portal-hyprland-0.pre+date=2022-12-05_af840a9/libexec/xdg-desktop-portal-hyprland

# SWWW
exec-once=swww init
exec-once=swww img ~/Pictures/wallpapers/annystartingshort.gif

# swayidle / lock
exec-once=~/.local/bin/lock

  '';
}
