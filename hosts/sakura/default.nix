{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
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

  virtualisation.docker.enable = true;
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
    nfs-utils
    pinentry-curses
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };
}
