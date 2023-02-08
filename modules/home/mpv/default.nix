{
 config,
 pkgs,
 ...
}: {
  programs.mpv = {
    enable = true;
    scripts = [
      pkgs.mpvScripts.mpris
    ];
    bindings = {
      WHEEL_UP = "volume 10";
      WHEEL_DOWN = "volume -10";
    };
  };
}