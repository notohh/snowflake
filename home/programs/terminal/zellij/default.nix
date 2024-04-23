_: {
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
    };
  };
}
