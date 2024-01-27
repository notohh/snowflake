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

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback.out];
  boot.kernelModules = ["v4l2loopback" "kvm-intel"];

  virtualisation.libvirtd.enable = true;

  services = {
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

  services.pcscd.enable = true;
  services.davfs2.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
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

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [
      inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    ];
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  hardware = {
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
    opengl = {
      enable = true;
      extraPackages = [pkgs.nvidia-vaapi-driver];
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
