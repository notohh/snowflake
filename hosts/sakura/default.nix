_: {
  imports = [
    ./hardware.nix
    ./services
    ./networking.nix
    ../common.nix
    ../../modules
  ];

  users = {
    users.notoh.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICqAjaV2D2J8ln4n39ZvszCF5Jql+0IaSpFCJlzDSLv6 sakura"
    ];
    users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMd8j1+fC/ng7l17rsxugVtlhurUe1ICizwA9lQkSuNY forgejo"
    ];
  };
}
