{inputs, ...}: {
  imports = [
    inputs.nh.nixosModules.default
    ./prometheus.nix
    ./security.nix
    ./users.nix
    ./nix.nix
    ./system.nix
    ./openssh.nix
    ./virtualisation.nix
    ./sops.nix
    ./time.nix
  ];
}
