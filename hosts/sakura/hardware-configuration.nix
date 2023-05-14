{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/db3e4722-35a6-44fb-8e4d-a75166b845cb";
    fsType = "ext4";
  };
  fileSystems."/home/notoh/docker/stash/data" = {
    device = "192.168.1.71:/volume1/stash";
    fsType = "nfs";
  };
  swapDevices = [
    {device = "/dev/disk/by-uuid/c5afba13-f1af-4e7f-994b-f565c52d92fc";}
  ];
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
