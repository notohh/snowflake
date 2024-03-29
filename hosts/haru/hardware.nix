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
      device = "/dev/disk/by-uuid/06177115-2e39-493b-81fb-5a1980ae0534";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/c879fa21-fd80-422c-9aef-0becce5ff19c";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
