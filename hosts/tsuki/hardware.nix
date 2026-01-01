{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = [ "kvm-amd" ];
    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "splash"
      "preempt=full"
      "threadirqs"
      "mitigations=off"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    initrd = {
      verbose = false;
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    plymouth = {
      enable = true;
      theme = "liquid";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "liquid" ];
        })
      ];
      extraConfig = ''
        DeviceScale=0
        ShowDelay=0
      '';
    };
  };
  hardware = {
    wooting.enable = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    amdgpu.overdrive.enable = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a423d32f-ac5d-4ea2-82fb-f94b05afce29";
      fsType = "ext4";
    };
    "/boot/efi" = {
      device = "/dev/disk/by-uuid/FEAF-138A";
      fsType = "vfat";
    };
    "/nas/restic" = {
      device = "192.168.1.199:/mnt/Sutoreji/nix-restic-data/tsuki";
      fsType = "nfs";
    };
    "/nas/osu-backups" = {
      device = "192.168.1.199:/mnt/Sutoreji/osu-backups";
      fsType = "nfs";
    };
  };

  zramSwap = {
    enable = true;
    swapDevices = 1;
    algorithm = "zstd";
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
