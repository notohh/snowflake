_: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        mode = "normal";
        framerate = 144;
        bars = 0;
        bar_width = 2;
        bar_spacing = 3;
      };
      smoothing = {
        monstercat = 1;
        waves = 1;
        gravity = 100;
      };
    };
  };
}
