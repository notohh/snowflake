{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
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
    flatpak.enable = true;
    scx = {
      enable = true;
      package = pkgs.scx.rustscheds;
      scheduler = "scx_lavd";
      extraArgs = [ "--performance" ];
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
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    udev.packages = with pkgs; [
      (writeTextFile {
        name = "70-vaxee.rules";
        destination = "/etc/udev/rules.d/70-vaxee.rules";
        text = ''
          KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3057", MODE="0660", GROUP="input", TAG+="uaccess"
          SUBSYSTEM=="usb", ATTRS{idVendor}=="3057", MODE="0660", GROUP="input", TAG+="uaccess"
        '';
      })
      (writeTextFile {
        name = "70-jds-element-iv.rules";
        destination = "/etc/udev/rules.d/70-jds-element-iv.rules";
        text = ''
          SUBSYSTEM=="usb", ATTR{idVendor}=="152a", ATTR{idProduct}=="88fa", TAG+="uaccess"
          SUBSYSTEM=="usb", ATTR{idVendor}=="152a", ATTR{idProduct}=="88fc", TAG+="uaccess"
          KERNEL=="ttyACM*", ATTRS{idVendor}=="152a", ATTRS{idProduct}=="88fa", MODE="0660"
        '';
      })
    ];
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
    streamcontroller.enable = true;
    gpu-screen-recorder.enable = true;
    nix-ld = {
      enable = true;
      libraries = [
        pkgs.wrangler
      ];
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
