{inputs, ...}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    inputs.nur.modules.nixos.default
    # inputs.attic.nixosModules.atticd
  ];
}
