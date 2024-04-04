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
        pkgs.proton-ge-bin
      ];
    };
  };

  hardware = {
    pulseaudio.enable = false;
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable.overrideAttrs {
        src = pkgs.fetchurl {
          url = "https://download.nvidia.com/XFree86/Linux-x86_64/535.171.04/NVIDIA-Linux-x86_64-535.171.04.run";
          sha256 = "0yj38aljmnr0c533d4hl5xjf9b3xm620fix4cp6qlpf99cxn9wg8";
        };
      };
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
    zulu8
  ];
}
