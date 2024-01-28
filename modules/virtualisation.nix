_: {
  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [
        "--all"
      ];
    };
    listenOptions = [
      "/run/docker.sock"
    ];
  };
}
