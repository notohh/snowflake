_: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "noshadow, floating:0"
      "float, title:^(Volume Control)$"
      "float, title:^(Picture in picture)$"
      "float, title:^(Friends List)$"
      "float, title:^(Cryptomator)$"
      "float, title:^(RuneLite)$"
      "float, title:^(Lutris)$"
      "float, title:^(satty)$"
      "float, title:^(Postman)$"
      "move 850 360, title:^(RuneLite)$"
      # "size 800 560, title:^(RuneLite)$"
      "size 1200 600, title:^(satty)$"
      "idleinhibit focus, class:^(mpv)$"
      "idleinhibit always, class:^(firefox)$, title:^(.*YouTube.*|.*Twitch.*)$"
      "idleinhibit always, class:^(com.obsproject.Studio)$"
      "idleinhibit always, class:^(com.moonlight_stream.Moonlight)$"
      "idleinhibit always, class:^(steam_app_)(.*)$"
      "immediate, class:^(steam_app_)(.*)$"
      "immediate, class:^(cs2)$"
    ];
    layerrule = [
      "blur, ^(gtk-layer-shell|walker)$"
    ];
  };
}
