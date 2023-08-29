{...}: {
  imports = [
    ./config.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    systemdIntegration = true;
    xwayland.enable = true;
  };
}
