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
      device = "/dev/disk/by-uuid/db3e4722-35a6-44fb-8e4d-a75166b845cb";
      fsType = "ext4";
    };
    "/home/notoh/rustlog/clickhouse" = {
      device = "192.168.1.199:/mnt/Sutoreji/twitchlogs-rustlog";
      fsType = "nfs";
    };
    "/nas/restic" = {
      device = "192.168.1.199:/mnt/Sutoreji/nix-restic-data/sakura";
      fsType = "nfs";
    };
    "/nas/vods" = {
      device = "192.168.1.199:/mnt/Sutoreji/vods";
      fsType = "nfs";
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/c5afba13-f1af-4e7f-994b-f565c52d92fc";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
