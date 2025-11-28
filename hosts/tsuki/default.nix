{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.hyprland.nixosModules.default
    ./hardware.nix
    ./services
    ./networking.nix
    ./gaming.nix
    ./topology.nix
    ../common
    ../common/fonts.nix
    ../../home/wayland
  ];

  virtualisation = {
    libvirtd.enable = true;
  };
  services = {
    pulseaudio.enable = false;
    lact.enable = true;
    pcscd.enable = true;
    scx = {
      enable = true;
      package = pkgs.scx.rustscheds;
      scheduler = "scx_lavd";
    };
    flatpak = {
      enable = true;
      packages = [
        "io.github.Soundux"
        "com.github.tchx84.Flatseal"
        "org.vinegarhq.Sober"
        "dev.goats.xivlauncher"
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        userServices = true;
        domain = true;
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam = {
      services.hyprlock = { };
    };
  };
  programs = {
    dconf.enable = true;
    corectrl.enable = true;
    nix-ld = {
      # for zed patching
      enable = true;
      libraries = with pkgs; [
        zlib
        openssl
      ];
    };
    hyprland = {
      enable = true;
      withUWSM = false;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vaapi
        obs-vkcapture
      ];
    };
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    nil
    libvirt
    qemu_kvm
    zulu
  ];
  system = {
    autoUpgrade.enable = false;
    stateVersion = "23.05";
  };
}
