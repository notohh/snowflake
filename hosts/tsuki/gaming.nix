{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
    inputs.nixpkgs-xr.nixosModules.nixpkgs-xr
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
    monado = {
      enable = true;
      highPriority = true;
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
    gamescope = {
      enable = true;
      capSysNice = false;
      args = [
        "--expose-wayland"
        "--framerate-limit 144"
      ];
    };
    steam = {
      enable = true;
      platformOptimizations.enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
        pkgs.proton-ge-rtsp-bin
      ];
    };
  };
}
