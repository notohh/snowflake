{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
    ./hardware.nix
    ./services
    ./networking.nix
    ../../home/wayland
    ../../modules
    ../../modules/fonts.nix
    ../../pkgs/overlays.nix
  ];

  virtualisation.libvirtd.enable = true;

  services = {
    pcscd.enable = true;
    flatpak.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      lowLatency = {
        enable = false; # disabled due to upstream issue
        quantum = 64;
        rate = 48000;
      };
    };
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
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
    gamemode.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = [
        inputs.nix-gaming.packages.${pkgs.system}.proton-ge
      ];
    };
  };

  hardware = {
    pulseaudio.enable = false;
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
      enable = true;
      extraPackages = [pkgs.nvidia-vaapi-driver];
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    nil
    dconf
    libvirt
    qemu_kvm
    jdk17
  ];
}
