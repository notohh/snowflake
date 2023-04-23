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
    device = "/dev/disk/by-uuid/154e6059-35f9-49bb-b049-085b325ac997";
    fsType = "ext4";
  };
  fileSystems."/home/oh/nas" = {
    device = "192.168.1.71:/volume1/hime";
    fsType = "nfs";
  };
  fileSystems."/home/oh/docker/nextcloud" = {
    device = "192.168.1.71:/volume1/nextcloud";
    fsType = "nfs";
  };
  fileSystems."/home/oh/docker/stash/data" = {
    device = "192.168.1.71:/volume1/stash";
    fsType = "nfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/15978bb3-da9b-4ec2-bd35-1716dd97812b";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
