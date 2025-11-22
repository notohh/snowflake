_: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # float
      "float on, match:title ^(Volume Control)$"
      "float on, match:title ^(Picture in picture)"
      "float on, match:title ^(Friends List)"
      "float on, match:title ^(Cryptomator)"
      "float on, match:title ^(RuneLite)$"
      "float on, match:title ^(Lutris)$"
      "float on, match:title ^(satty)$"
      "float on, match:title ^(Postman)$"

      # idle_inhibit
      "idle_inhibit focus, match:class ^(mpv)$"
      "idle_inhibit always, match:class ^(firefox)$, match:title ^(.*YouTube.*|.*Twitch.*)$"
      "idle_inhibit always, match:class ^(com.obsproject.Studio)$"
      "idle_inhibit always, match:class ^(com.moonlight_stream.Moonlight)$"
      "idle_inhibit always, match:class ^(steam_app_)(.*)$"

      #immediate
      "immediate on, match:class ^(steam_app_)(.*)$"
      "immediate on, match:class ^(cs2)$"
      "immediate on, match:class ^(osu!)$"

      #misc
      "move 850 360, match:title ^(RuneLite)$"
      "size 1200 600, match:title ^(satty)$"
      "no_screen_share on, match:class ^(Signal)$"
    ];
    layerrule = [
      "blur on, match:namespace ^(gtk-layer-shell|walker)$"
      "blur off, match:namespace ^(wayscriber|selection|satty)$"
    ];
  };
}
