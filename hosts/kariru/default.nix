{...}: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ../common.nix
    ../../modules
  ];

  users = {
    users.notoh.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPmWafzbhah18nm2z1epc6139XVlcKT0ndAI0wbLj+/6 kariru"
    ];
    users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMd8j1+fC/ng7l17rsxugVtlhurUe1ICizwA9lQkSuNY forgejo"
    ];
  };
}
