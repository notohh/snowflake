_: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ../common
    ../common/fonts.nix
  ];

  programs.hyprland.enable = true;

  services = {
    displayManager.sddm.enable = true;
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

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
}
