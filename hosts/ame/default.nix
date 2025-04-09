_: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ./topology.nix
    ../common
    ../common/fonts.nix
  ];

  services = {
    pulseaudio.enable = false;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    fprintd = {
      enable = true;
    };
  };

  system.stateVersion = "23.05";
  security.rtkit.enable = true;
}
