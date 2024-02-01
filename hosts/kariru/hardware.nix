{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot = {
    kernelModules = [];
    extraModulePackages = [];
    loader.grub = {
      enable = true;
      configurationLimit = 5;
      device = "/dev/sda";
      useOSProber = false;
    };
    initrd = {
      availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod"];
      kernelModules = [];
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/f5a0738c-d027-4ffb-82ec-9901ca6b310b";
      fsType = "ext4";
    };
    "/media" = {
      device = "192.168.1.199:/mnt/Sutoreji/media";
      fsType = "nfs";
    };
    "/stash" = {
      device = "192.168.1.199:/mnt/Sutoreji/stash";
      fsType = "nfs";
    };
    "/nas/restic" = {
      device = "192.168.1.199:/mnt/Sutoreji/nix-restic-data/kariru";
      fsType = "nfs";
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/f28bad28-ae14-4aa7-85c5-47abe46bae56";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
