_: {
  networking.firewall.allowedTCPPorts = [8025];
  virtualisation.oci-containers.containers.justlog = {
    image = "ghcr.io/gempir/justlog@sha256:44b2426c0057b44019b78b1daece13dac2356ff68f9f506f067c8c4c92f54f22";
    ports = ["8025:8025"];
    volumes = [
      "/home/notoh/justlog/config.json:/etc/justlog.json"
      "/home/notoh/justlog/logs:/logs"
    ];
  };
}
