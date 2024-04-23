{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    # ./disko-config.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = ["v4l2loopback" "kvm-intel"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback.out];
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
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = [];
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/7d098aab-1968-4605-a9a7-b1627941c1ff";
      fsType = "ext4";
    };
    "/boot/efi" = {
      device = "/dev/disk/by-uuid/C356-B67C";
      fsType = "vfat";
    };
    "/hdd" = {
      device = "/dev/disk/by-uuid/e2e4c4f3-51df-4020-b557-a7cf684de85b";
      fsType = "ext4";
    };
    "/ssd" = {
      device = "/dev/disk/by-uuid/9e5a189d-7435-45d7-aef6-cdee4de2428d";
      fsType = "ext4";
    };
    "/nas/restic" = {
      device = "192.168.1.199:/mnt/Sutoreji/nix-restic-data/tsuki";
      fsType = "nfs";
    };
    "/nas/ISOS" = {
      device = "192.168.1.199:/mnt/Sutoreji/ISOS";
      fsType = "nfs";
    };
    "/nas/osu-backups" = {
      device = "192.168.1.199:/mnt/Sutoreji/osu-backups";
      fsType = "nfs";
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/2f5e2c64-99b8-4fa0-943c-c9dd45c84fdc";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
