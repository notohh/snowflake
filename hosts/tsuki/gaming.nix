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
      defaultRuntime = true;
      openFirewall = true;
      autoStart = true;
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
          "nice" = -20;
        }
      ];
    };
  };
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam-millennium;
      platformOptimizations.enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };
  };
}
