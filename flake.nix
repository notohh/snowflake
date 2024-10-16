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
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprsysteminfo.url = "github:hyprwm/hyprsysteminfo";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    ### other stuff
    nix-gaming.url = "github:fufexan/nix-gaming";
    attic.url = "github:zhaofengli/attic";
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
    #  wezterm.url = "github:notohh/wezterm?dir=nix&ref=nix-add-overlay";

    botoh.url = "git+https://git.flake.sh/notohh/botoh";
    zen-browser.url = "github:fufexan/zen-browser-flake";
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
  };
}
