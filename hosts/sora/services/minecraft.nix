_: {
  networking.firewall.allowedTCPPorts = [25565];
  networking.firewall.allowedUDPPorts = [24454];
  virtualisation.oci-containers.containers.minecraft = {
    image = "itzg/minecraft-server";
    ports = ["25565:25565" "24454:24454/udp"];
    environment = {
      EULA = "TRUE";
      VERSION = "1.21.1";
      MEMORY = "12G";
      TYPE = "NEOFORGE";
    };
    volumes = ["/home/notoh/docker/modded-mc:/data:rw"];
  };
}
