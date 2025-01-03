{inputs, ...}: {
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      inputs.helix.overlays.default
      inputs.yazi.overlays.default
      inputs.hypridle.overlays.default
      inputs.hyprlock.overlays.default
      inputs.hyprpaper.overlays.default
      inputs.hyprpicker.overlays.default
      inputs.atuin.overlays.default
      inputs.eww.overlays.default
      inputs.neptune.overlays.default
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-runtime-6.0.36"
        "dotnet-sdk-wrapped-6.0.428"
        "dotnet-sdk-6.0.428"
        "aspnetcore-runtime-wrapped-6.0.36"
        "aspnetcore-runtime-6.0.36"
        "cinny-4.2.3"
        "cinny-unwrapped-4.2.3"
      ];
    };
  };

  nix = {
    channel.enable = true;
    settings = {
      extra-experimental-features = ["flakes" "nix-command"];
      warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      download-buffer-size = 536870912;
      keep-outputs = true;
      keep-derivations = true;
      allowed-users = ["@wheel"];
      trusted-users = ["root" "@wheel"];
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://cache.flake.sh/kyasshu"
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://anyrun.cachix.org"
        "https://viperml.cachix.org"
        "https://nix-community.cachix.org"
        "https://attic.kennel.juneis.dog/conduwuit"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "kyasshu:g1heIgCgG7M4San6nRsz/omcVQ1GTc7+zKKm3L9Co7o="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "conduwuit:BbycGUgTISsltcmH0qNjFR9dbrQNYgdIAcmViSGoVTE="
      ];
    };
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 5";
    };
  };
}
