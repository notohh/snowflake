_: {
  imports = [
    ./config.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;
  };
}
