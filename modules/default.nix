{inputs, ...}: {
  imports = [
    inputs.nh.nixosModules.default
    ./prometheus
    ./security.nix
    ./networking.nix
    ./users.nix
    ./nix.nix
    ./system.nix
    ./openssh.nix
    ./virtualisation.nix
    ./sops.nix
  ];
}
