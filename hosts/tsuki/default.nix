{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
    inputs.nix-gaming.nixosModules.platformOptimizations
    inputs.hyprland.nixosModules.default
    ./hardware.nix
    ./services
    ./networking.nix
    ../common.nix
    ../../home/wayland
    ../../modules
    ../../modules/fonts.nix
    ../../pkgs/overlays.nix
  ];

  virtualisation = {
    libvirtd.enable = true;
    waydroid.enable = false;
  };
  programs.hyprland = {
    enable = true;
    #  finalPackage = inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage = inputs.xdg-portal-hyprland.packages.${pkgs.system}.default;
  };

  services = {
    pcscd.enable = true;
    flatpak.enable = true;
    avahi = {
      enable = true;
      openFirewall = true;
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
    dconf.enable = true;
    gamemode.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    steam = {
      enable = true;
      platformOptimizations.enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };
  };

  hardware = {
    pulseaudio.enable = false;
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
}
