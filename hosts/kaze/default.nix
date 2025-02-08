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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE4qfqJNxwNg9ryeT/XbjfQyuDKbBAwRn2Lzq3Iq5kA7 kaze"
    ];
    users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMd8j1+fC/ng7l17rsxugVtlhurUe1ICizwA9lQkSuNY forgejo"
    ];
  };
}
