_: {
  imports = [
    ./layouts.nix
  ];

  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      simplified_ui = false;
      theme = "tokyo-night";
      default_layout = "default";
      copy_command = "wl-copy";
      copy_clipboard = "primary";
      ui.pane_frames.rounded_corners = true;
    };
  };
}
