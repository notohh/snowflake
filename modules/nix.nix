{inputs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [inputs.prismlauncher.overlays.default];
  };

  nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 5";
    };
  };

  nix = {
    settings = {
      extra-experimental-features = ["flakes" "nix-command"];
      warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      keep-outputs = true;
      allowed-users = ["@wheel"];
      trusted-users = ["root" "@wheel"];
      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
        "https://jakestanger.cachix.org"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "jakestanger.cachix.org-1:VWJE7AWNe5/KOEvCQRxoE8UsI2Xs2nHULJ7TEjYm7mM="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
    };
  };
}
