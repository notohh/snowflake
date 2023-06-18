{
  lib,
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
    device = "/dev/disk/by-uuid/3fd88f1f-cec3-4737-b9d0-6c8f026c3927";
    fsType = "ext4";
  };

  fileSystems."/nas" = {
    device = "192.168.1.71:/volume1/arashi";
    fsType = "nfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/e9eb4b6a-e9a1-4616-8c82-349d2f38d140";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
