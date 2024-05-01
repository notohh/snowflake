{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    #  ./disko-config.nix
  ];

  boot = {
    kernelModules = ["v4l2loopback" "kvm-amd"];
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

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
