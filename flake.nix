{
  description = "snowflake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
    nix-gaming.url = "github:fufexan/nix-gaming";
    attic.url = "github:zhaofengli/attic";
    nur.url = "github:nix-community/NUR";
    yazi.url = "github:sxyazi/yazi";
    helix.url = "github:helix-editor/helix";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    pre-commit-hooks,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    checks = {
      pre-commit-check = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          stylua.enable = true;
          eslint.enable = true;
          statix.enable = true;
          alejandra.enable = true;
          deadnix = {
            enable = true;
            excludes = ["overlays.nix"];
          };
          prettier = {
            enable = true;
            files = "\\.(js|ts|md)$";
          };
        };
      };
    };
    devShells.${system}.default = pkgs.mkShell {
      name = "snowflake";
      inherit (self.checks.pre-commit-check) shellHook;
      packages = with pkgs; [
        git
        sops
        yaml-language-server
        lua-language-server
      ];
    };
    formatter.${system} = pkgs.alejandra;
    deploy = import ./hosts/deploy.nix inputs;
    nixosConfigurations = import ./hosts inputs;
  };
}
