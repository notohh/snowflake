{
  inputs,
  config,
  ...
}:
{
  sops.secrets.github-token = { };
  nixpkgs = {
    overlays = [
      inputs.self.overlays.gale
      inputs.nur.overlays.default
      inputs.helix.overlays.default
      inputs.copyparty.overlays.default
      inputs.millennium.overlays.default
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "qtwebengine-5.15.19"
      ];
    };
  };

  nix = {
    channel.enable = true;
    settings = {
      extra-experimental-features = [
        "flakes"
        "nix-command"
      ];
      warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      download-buffer-size = 536870912;
      keep-outputs = true;
      keep-derivations = true;
      allowed-users = [ "@wheel" ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://cache.flake.sh/kyasshu"
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://anyrun.cachix.org"
        "https://viperml.cachix.org"
        "https://nix-community.cachix.org"
        "https://prismlauncher.cachix.org"
        "https://yazi.cachix.org"
        "https://helix.cachix.org"
        "https://walker-git.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "kyasshu:g1heIgCgG7M4San6nRsz/omcVQ1GTc7+zKKm3L9Co7o="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      ];
    };
    extraOptions = ''
      !include ${config.sops.secrets.github-token.path}
    '';
  };

  programs.nh = {
    enable = true;
    flake = "/home/notoh/snowflake";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 5";
    };
  };
}
