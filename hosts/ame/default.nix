{...}: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ../../modules
    ../../modules/fonts.nix
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

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
}
