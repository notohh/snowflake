{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
    inputs.nixpkgs-xr.nixosModules.nixpkgs-xr
  ];
  services = {
    wivrn = {
      enable = true;
      defaultRuntime = true;
      openFirewall = true;
      autoStart = true;
      monadoEnvironment = {
        U_PACING_COMP_MIN_TIME_MS = "8";
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
  };
  programs = {
    gamemode = {
      enable = true;
      enableRenice = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
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
