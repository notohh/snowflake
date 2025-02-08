{inputs, ...}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    inputs.nur.modules.nixos.default
    inputs.nix-topology.nixosModules.default
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
