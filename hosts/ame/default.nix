{inputs, ...}: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ./topology.nix
    ../common
    ../common/fonts.nix
    inputs.nixos-cosmic.nixosModules.default
  ];

  services = {
    pulseaudio.enable = false;
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
  system.stateVersion = "23.05";
  security.rtkit.enable = true;
}
