{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.steamCompat
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
      videoDrivers = ["nvidia"];
      layout = "us";
      xkbVariant = "";
    };
    udev = {
      extraRules = ''
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", TAG+="uaccess"
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2403", TAG+="uaccess"
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"
      '';
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock = {
      text = ''
        auth include login
      '';
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
      package = config.boot.kernelPackages.nvidiaPackages.production;
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
