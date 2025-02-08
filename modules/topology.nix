{
  inputs,
  self,
  ...
}: {
  imports = [
    inputs.nix-topology.flakeModule
  ];
  perSystem = _: {
    topology.modules = [
      {
        inherit (self) nixosConfigurations;
      }
    ];
  };
}
