{
  description = "snowflake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./hosts
        ./overlays
        ./modules
        ./hosts/deploy.nix
        ./home/profiles
      ];
      systems = ["x86_64-linux"];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
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
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprutils.follows = "hyprutils";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprutils.follows = "hyprutils";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprutils.follows = "hyprutils";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprutils.follows = "hyprutils";
    };
    hyprsunset = {
      url = "github:hyprwm/hyprsunset";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprutils.follows = "hyprutils";
    };
    hyprutils = {
      url = "github:hyprwm/hyprutils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner";
      inputs.nixpkgs.follows = "nixpkgs";
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
    anyrun.url = "github:Kirottu/anyrun";
    botoh.url = "git+https://git.flake.sh/notohh/botoh";
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
    manga-tui.url = "github:josueBarretogit/manga-tui";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    scls = {
      url = "github:estin/simple-completion-language-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-topology = {
      url = "github:oddlama/nix-topology";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flocon = {
      url = "git+https://git.nezia.dev/nezia/flocon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
