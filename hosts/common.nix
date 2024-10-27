{inputs, ...}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    inputs.nur.nixosModules.nur
    # inputs.attic.nixosModules.atticd
  ];
}
