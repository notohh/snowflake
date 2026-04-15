{
  inputs,
  config,
  lib,
  ...
}:
{
  sops.secrets.github-token = { };
  nixpkgs = {
    overlays = [
      # inputs.self.overlays.gale
      inputs.self.overlays.default
      inputs.nur.overlays.default
      inputs.helix.overlays.default
      inputs.copyparty.overlays.default
      inputs.niri.overlays.niri
      inputs.nix-cachyos-kernel.overlays.default
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "qtwebengine-5.15.19"
      ];
    };
    hostPlatform = lib.mkDefault "x86_64-linux";
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
        "https://nix-gaming.cachix.org"
        "https://viperml.cachix.org"
        "https://nix-community.cachix.org"
        "https://prismlauncher.cachix.org"
        "https://yazi.cachix.org"
        "https://helix.cachix.org"
        "https://attic.xuyh0120.win/lantian"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "kyasshu:g1heIgCgG7M4San6nRsz/omcVQ1GTc7+zKKm3L9Co7o="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
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
