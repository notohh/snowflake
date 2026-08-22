{
  description = "snowflake";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./hosts
        ./overlays
        ./modules
        ./pkgs
        ./home/profiles
      ];
      systems = [ "x86_64-linux" ];
      perSystem =
        {
          config,
          pkgs,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            name = "snowflake";
            shellHook = config.pre-commit.installationScript;
            packages = with pkgs; [
              sops
              statix
              just
              yaml-language-server
              lua-language-server
              stylua
            ];
          };
          formatter = pkgs.nixfmt;
        };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    low-latency-layer.url = "github:NixOS/nixpkgs/pull/523475/head";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-package = {
      url = "github:urayde/niri";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:epireyn/niri-flake";
      inputs.niri-unstable.follows = "niri-package";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs.url = "github:serokell/deploy-rs";
    sops-nix.url = "github:Mic92/sops-nix";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nur.url = "github:nix-community/NUR";
    yazi.url = "github:sxyazi/yazi";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
    nix-topology.url = "github:oddlama/nix-topology";
    copyparty.url = "github:9001/copyparty";
    stylix.url = "github:nix-community/stylix";
    awakened-poe-flake.url = "git+https://git.flake.sh/notohh/awakened-poe-flake";
    awww.url = "git+https://codeberg.org/LGFae/awww";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };
}
