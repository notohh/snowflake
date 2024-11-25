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

    ### hypr
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprutils.url = "github:hyprwm/hyprutils";
    xdg-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprutils.follows = "hyprutils";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    ### other stuff
    nix-gaming.url = "github:fufexan/nix-gaming";
    nur.url = "github:nix-community/NUR";
    yazi.url = "github:sxyazi/yazi";
    helix.url = "github:helix-editor/helix";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    atuin.url = "github:atuinsh/atuin";
    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix";
    eww.url = "github:elkowar/eww";
    anyrun.url = "github:Kirottu/anyrun";
    botoh.url = "git+https://git.flake.sh/notohh/botoh";
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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nezia-dotfiles = {
      url = "github:nezia1/flocon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
