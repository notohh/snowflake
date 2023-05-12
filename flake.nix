{
  description = "snowflake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs = {
      url = "github:serokell/deploy-rs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "snowflake";
      packages = with pkgs; [
        nil
        yaml-language-server
        alejandra
        git
        deploy-rs
        sops
        file
        inlyne
      ];
    };
    deploy = import ./hosts/deploy.nix inputs;
    formatter.${system} = pkgs.alejandra;
    nixosConfigurations = import ./hosts/systems.nix inputs;
  };
}
