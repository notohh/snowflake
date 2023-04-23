{...}: {
  imports = [
    ./layouts.nix
  ];

  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      simplified_ui = false;
      default_layout = "default";
      ui.pane_frames.rounded_corners = true;
      theme = "catppuccin-mocha";
      themes.catppuccin-mocha = {
        bg = "#585b70";
        fg = "#cdd6f4";
        red = "#f38ba8";
        green = "#a6e3a1";
        blue = "#89b4fa";
        yellow = "#f9e2af";
        magenta = "#f5c2e7";
        orange = "#fab387";
        cyan = "#89dceb";
        black = "#181825";
        white = "#cdd6f4";
      };
    };
  };
}
