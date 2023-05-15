{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/services
  ];

  boot.loader = {
    grub = {
      enable = true;
      configurationLimit = 3;
      device = "/dev/sda";
      useOSProber = false;
    };
  };

  networking = {
    hostName = "sakura";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users = {
    defaultUserShell = pkgs.nushell;
    users.notoh = {
      isNormalUser = true;
      description = "notoh";
      extraGroups = ["networkmanager" "wheel" "docker"];
    };
  };

  environment.systemPackages = with pkgs; [
    wget
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };
}
