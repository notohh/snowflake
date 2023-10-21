_: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./services
    ../../modules
  ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "sora";
  users.users.notoh.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGmI3hRDFjxLjrM3pE471e4jxSlcqeizh3iNVVdaMHeN sora"
  ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINGPcRO9BzKIhAxiyVnRIcByaMTrxeeeJqB8iXcmhrI4 forgejo"
  ];
}
