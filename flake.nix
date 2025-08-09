{
  description = "snowflake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./hosts
        ./overlays
        ./modules
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
            just
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
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprsunset.url = "github:hyprwm/hyprsunset";

    ### everything else
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs.url = "github:serokell/deploy-rs";
    sops-nix.url = "github:Mic92/sops-nix";
    zen.url = "github:youwen5/zen-browser-flake";
    scls.url = "github:estin/simple-completion-language-server";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nur.url = "github:nix-community/NUR";
    yazi.url = "github:sxyazi/yazi";
    helix.url = "github:helix-editor/helix";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-parts.url = "github:hercules-ci/flake-parts";
    anyrun.url = "github:Kirottu/anyrun";
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
    manga-tui.url = "github:josueBarretogit/manga-tui";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-topology.url = "github:oddlama/nix-topology";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    copyparty.url = "github:9001/copyparty";
  };
}
