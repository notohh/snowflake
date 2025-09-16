{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    inputs.nur.modules.nixos.default
    inputs.nix-topology.nixosModules.default
    inputs.nix-flatpak.nixosModules.nix-flatpak
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
