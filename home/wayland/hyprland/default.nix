{inputs, ...}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./config/general.nix
    ./config/binds.nix
    ./config/rules.nix
    # ./config/plugins.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    package = null;
    portalPackage = null;
  };
}
