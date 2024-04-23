{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    ./disko-config.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 8;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "sd_mod"];
      kernelModules = [];
    };
  };

  zramSwap = {
    enable = true;
    swapDevices = 1;
    algorithm = "zstd";
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
