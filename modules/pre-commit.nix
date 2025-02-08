{inputs, ...}: {
  imports = [
    inputs.pre-commit-hooks.flakeModule
  ];
  perSystem.pre-commit = {
    check.enable = true;
    settings = {
      excludes = ["flake.lock"];
      hooks = {
        stylua.enable = true;
        statix.enable = true;
        alejandra.enable = true;
        deadnix = {
          enable = true;
          excludes = ["technorino.nix"];
        };
        prettier = {
          enable = true;
          files = "\\.(js|ts|md|json)$";
          settings = {
            trailing-comma = "none";
          };
        };
      };
    };
  };
}
