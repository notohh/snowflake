{...}: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ./topology.nix
    ../common
  ];

  users = {
    users.notoh.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKwby2FLCKFZZlOLDRhsm9GckyYAuyk0mq28jRD02tdv tsuru"
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
