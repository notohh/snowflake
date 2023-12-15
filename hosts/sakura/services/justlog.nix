{...}: {
  networking.firewall.allowedTCPPorts = [8025];
  virtualisation.oci-containers.containers.justlog = {
    image = "ghcr.io/gempir/justlog";
    ports = ["8025:8025"];
    volumes = [
      "/home/notoh/justlog/config.json:/etc/justlog.json"
      "/home/notoh/justlog/logs:/logs"
    ];
  };
}
