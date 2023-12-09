_: {
  imports = [
    ./config.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;
  };
  services.wlsunset = {
    enable = false;
    latitude = "40.712776";
    longitude = "-74.005974";
    temperature = {
      day = 6500;
      night = 3200;
    };
  };
}
