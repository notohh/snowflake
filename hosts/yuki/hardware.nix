{
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot = {
    kernelModules = [ ];
    extraModulePackages = [ ];
    loader.grub = {
      enable = true;
      configurationLimit = 5;
      device = "/dev/sda";
      useOSProber = false;
    };
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [ ];
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/833959fb-de9d-4820-aa22-e6ce8bce6f6c";
      fsType = "ext4";
    };
    "/media" = {
      device = "192.168.1.199:/mnt/Sutoreji/media";
      fsType = "nfs";
    };
    "/nas/restic" = {
      device = "192.168.1.199:/mnt/Sutoreji/nix-restic-data/yuki";
      fsType = "nfs";
    };
    "/var/lib/immich" = {
      device = "192.168.1.199:/mnt/Sutoreji/immich";
      fsType = "nfs";
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/bd7ccb73-6f85-4b3d-b37f-5cff58a6ab59"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
