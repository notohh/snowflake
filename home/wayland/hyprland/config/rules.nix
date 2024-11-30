_: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "noshadow, floating:0"
      "float, title:^(Volume Control)$"
      "float, title:^(Picture in picture)$"
      "float, title:^(Friends List)$"
      "float, title:^(Cryptomator)$"
      "float, title:^(RuneLite)$"
      "float, title:^(Lutris)$"
      "float, title:^(satty)$"
      "move 850 360, title:^(RuneLite)$"
      # "size 800 560, title:^(RuneLite)$"
      "size 1200 600, title:^(satty)$"
      "idleinhibit focus, class:^(mpv)$"
      "idleinhibit always, class:^(firefox)$, title:^(.*YouTube.*|.*Twitch.*)$"
      "idleinhibit always, class:^(OBS Studio)$"
      "idleinhibit always, class:^(Moonlight)$"
      "idleinhibit always, class:^(VRChat)$"
      "idleinhibit fullscreen, class:^(firefox)$"
    ];
    layerrule = [
      "blur, ^(gtk-layer-shell|anyrun|eww|music-widget)$"
    ];
  };
}
