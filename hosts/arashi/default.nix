{...}: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ../../modules
  ];

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.notoh.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWRbIwwHuyEOLhA9dKTf4TgFqtPR5MNcJorKm731S7G arashi"
  ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMd8j1+fC/ng7l17rsxugVtlhurUe1ICizwA9lQkSuNY forgejo"
  ];
}
