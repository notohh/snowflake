{
  description = "notohh's flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
     
    # Call hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";

      inputs.nixpkgs.follows = "nixpkgs";
      };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };

  };

  outputs = { nixpkgs, home-manager, self, hyprland, ... }@inputs: {

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; flake-self = self; };

     modules = [ ./configuration.nix 
    
        hyprland.nixosModules.default
        { programs.hyprland.enable = true; }
	      ];
      };
    };

    homeConfigurations = {
      "notoh@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 
        extraSpecialArgs = { inherit inputs; }; 
  
        modules = [./home-manager/home.nix ];
      };
    };
  };
  
}
