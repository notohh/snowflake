{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];
  environment.systemPackages = [
    pkgs.android-tools # for wired wivrn
  ];
  services = {
    wivrn = {
      enable = true;
      openFirewall = true;
      autoStart = true;
      steam.importOXRRuntimes = true;
      monadoEnvironment = {
        U_PACING_COMP_MIN_TIME_MS = "8";
        XRT_COMPOSITOR_COMPUTE = "1";
      };
    };
    sunshine = {
      enable = true;
      autoStart = false;
      openFirewall = true;
      capSysAdmin = true;
    };
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-cpp;
      extraRules = [
        {
          "name" = "gamescope";
          "nice" = -10;
        }
        {
          "name" = "cs2";
          "nice" = -15;
        }
      ];
    };
  };
  programs = {
    gamemode.enable = true;
    gamescope.enable = true;
    steam = {
      enable = true;
      platformOptimizations.enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };
  };
}
