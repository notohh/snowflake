{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs; [
      mpvScripts.uosc
      mpvScripts.mpris
      mpvScripts.smartskip
      mpvScripts.thumbfast
      mpvScripts.videoclip
    ];
    scriptOpts = {
      thumbfast = {
        spawn_first = true;
        network = true;
        hwdec = true;
      };
    };
    config = {
      osc = false;
      osd-bar = false;
      volume = 60;
      save-position-on-quit = true;
    };
  };
}
