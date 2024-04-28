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
      color = {
        gradient = 1;
        gradient_count = 2;
        gradient_color_2 = "'#f7768e'";
        gradient_color_1 = "'#7dcfff'";
      };
      smoothing = {
        monstercat = 1;
        waves = 1;
        gravity = 100;
      };
    };
  };
}
