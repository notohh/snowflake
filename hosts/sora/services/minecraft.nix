_: {
  networking.firewall.allowedTCPPorts = [25565];
  networking.firewall.allowedUDPPorts = [24454];
  virtualisation.oci-containers.containers.minecraft = {
    image = "itzg/minecraft-server";
    ports = ["25565:25565" "24454:24454/udp"];
    environment = {
      EULA = "TRUE";
      VERSION = "1.19.2";
      MEMORY = "8G";
      TYPE = "FABRIC";
      FABRIC_LOADER_VERSION = "0.14.23";
      FABRIC_LAUNCHER_VERSION = "0.11.2";
    };
    volumes = [
      "/home/notoh/docker/modded-mc:/data:rw"
    ];
  };
}
