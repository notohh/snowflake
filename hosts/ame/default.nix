_: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ./topology.nix
    ../common
    ../common/fonts.nix
  ];

  programs.hyprland.enable = true;

  services = {
    pulseaudio.enable = false;
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
  security.rtkit.enable = true;
}
