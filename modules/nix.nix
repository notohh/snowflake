{pkgs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "qtwebkit-5.212.0-alpha4"
        "nodejs-16.20.0"
      ];
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      warn-dirty = false
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      extra-experimental-features = ["flakes" "nix-command"];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      keep-derivations = true;
      keep-outputs = true;
      allowed-users = ["@wheel"];
      trusted-users = ["root" "@wheel"];
      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
  };
}
