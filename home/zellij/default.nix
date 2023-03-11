{
  default,
  ...
}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "custom";
      themes.custom.bg = "#585b70";
      themes.custom.fg = "#cdd6f4";
      themes.custom.red = "#f38ba8";
      themes.custom.green = "#a6e3a1";
      themes.custom.blue = "#89b4fa";
      themes.custom.yellow = "#f9e2af";
      themes.custom.magenta = "#f5c2e7";
      themes.custom.orange = "#fab387";
      themes.custom.cyan = "#89dceb";
      themes.custom.black = "#181825";
      themes.custom.white = "#cdd6f4";
    };
  };
}
