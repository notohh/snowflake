_: {
  imports = [
    ./hardware.nix
    ./networking.nix
    ./services
    ./topology.nix
    ../common
  ];

  services.snowflake-proxy.enable = true;

  users = {
    users.notoh.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGmI3hRDFjxLjrM3pE471e4jxSlcqeizh3iNVVdaMHeN sora"
    ];
    users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMd8j1+fC/ng7l17rsxugVtlhurUe1ICizwA9lQkSuNY forgejo"
    ];
  };
  system = {
    autoUpgrade.enable = false;
    stateVersion = "23.05";
  };
}
