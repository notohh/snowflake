{pkgs, ...}: {
  environment.systemPackages = with pkgs; [docker-compose];

  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
    listenOptions = [
      "/run/docker.sock"
    ];
  };
}
