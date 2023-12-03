{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/56f5b5b9-9ab5-4c05-be80-2e34405bfbd9";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/4E08-C711";
    fsType = "vfat";
  };

  fileSystems."/nas" = {
    device = "192.168.1.199:/mnt/Sutoreji/yuki";
    fsType = "nfs";
  };

  fileSystems."/home/notoh/docker/stash/data" = {
    device = "192.168.1.199:/mnt/Sutoreji/stash";
    fsType = "nfs";
  };

  fileSystems."/media" = {
    device = "192.168.1.199:/mnt/Sutoreji/media";
    fsType = "nfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/34a9e234-35da-4140-b231-2bb983a5204b";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
