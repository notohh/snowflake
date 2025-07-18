{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
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
    pcscd.enable = true;
    flatpak = {
      enable = true;
      packages = [
        "io.github.Soundux"
        "com.github.tchx84.Flatseal"
        "org.vinegarhq.Sober"
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
      lowLatency = {
        enable = true;
        quantum = 64;
        rate = 48000;
      };
    };
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
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
      services.hyprlock = {};
    };
  };
  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
    corectrl.enable = true;
    dconf.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
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
    zulu17
  ];

  system = {
    autoUpgrade.enable = false;
    stateVersion = "23.05";
  };
}
