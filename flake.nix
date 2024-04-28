{
  description = "snowflake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.pre-commit-hooks.flakeModule
        ./hosts
        ./hosts/deploy.nix
        ./home/profiles
      ];
      systems = ["x86_64-linux"];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
        pre-commit = {
          check.enable = true;
          settings = {
            excludes = ["flake.lock"];
            hooks = {
              stylua.enable = true;
              statix.enable = true;
              alejandra.enable = true;
              deadnix = {
                enable = true;
                excludes = ["overlays.nix"];
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
        devShells.default = pkgs.mkShell {
          name = "snowflake";
          shellHook = config.pre-commit.installationScript;
          packages = with pkgs; [
            git
            sops
            alejandra
            yaml-language-server
            lua-language-server
          ];
        };
        formatter = pkgs.alejandra;
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprcursor.url = "github:hyprwm/hyprcursor";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";
    attic.url = "github:zhaofengli/attic";
    nur.url = "github:nix-community/NUR";
    yazi.url = "github:sxyazi/yazi";
    helix.url = "github:helix-editor/helix";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    wezterm.url = "github:notohh/wezterm?dir=nix&ref=nix-add-overlay";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    atuin.url = "github:atuinsh/atuin";
    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix";
    eww.url = "github:elkowar/eww";
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
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
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
