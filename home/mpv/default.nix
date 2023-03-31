{
  pkgs,
  ...
}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs; [
      mpvScripts.mpris
    ];
    bindings = {
      WHEEL_UP = "volume 10";
      WHEEL_DOWN = "volume -10";
    };
  };
}