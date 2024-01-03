_: {
  imports = [
    ./config/general.nix
    ./config/binds.nix
    ./config/rules.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
  };
}
