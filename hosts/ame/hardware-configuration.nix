{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/57411820-f154-497e-9c7e-dfcb1f21c5cf";
    fsType = "ext4";
  };

  fileSystems."/nas" = {
    device = "192.168.1.71:/volume1/ame";
    fsType = "nfs";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/4D09-1D57";
    fsType = "vfat";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/4f69ab31-f6a9-4799-92f1-5abbe0dc9180";}
  ];
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
