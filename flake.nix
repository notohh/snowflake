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

    ### hypr
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # hypridle.url = "github:hyprwm/hypridle";
    # hyprlock.url = "github:hyprwm/hyprlock";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    ### everything else
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
    technorino = {
      url = "git+https://github.com/2547techno/technorino";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
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
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-topology.url = "github:oddlama/nix-topology";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    copyparty.url = "github:9001/copyparty";
    stylix.url = "github:nix-community/stylix";
    vicinae.url = "github:vicinaehq/vicinae";
    awakened-poe-flake.url = "git+https://git.flake.sh/notohh/awakened-poe-flake";
    awww.url = "git+https://codeberg.org/LGFae/awww";
    niri.url = "github:sodiboo/niri-flake";
  };
}
