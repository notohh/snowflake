{...}: {
  imports = [
    ./security.nix
    ./networking.nix
    ./nix.nix
    ./system.nix
    ./openssh.nix
    ./virtualisation.nix
  ];
}
