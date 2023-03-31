{
  ...
}: {
  imports = [./config.nix];
  
  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;
  };

  services.wlsunset = {
    enable = false; #not working on my nvidia card currently
    latitude = "40.712776";
    longitude = "-74.005974";
    temperature = {
      day = 6200;
      night = 3750;
    };
  };
}