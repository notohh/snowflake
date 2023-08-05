{
  description = "snowflake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
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
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ironbar = {
      url = "github:JakeStanger/ironbar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    attic = {
      url = "github:zhaofengli/attic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "snowflake";
      packages = with pkgs; [
        nil
        git
        sops
        alejandra
        yaml-language-server
      ];
    };
    formatter.${system} = pkgs.alejandra;
    deploy = import ./hosts/deploy.nix inputs;
    nixosConfigurations = import ./hosts inputs;
  };
}
