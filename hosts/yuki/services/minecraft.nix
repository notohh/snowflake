{...}: {
  networking.firewall.allowedTCPPorts = [25565];
  virtualisation.oci-containers.containers.minecraft = {
    image = "marctv/minecraft-papermc-server:latest";
    ports = ["25565:25565"];
    environment = {
      MEMORYSIZE = "10G";
    };
    volumes = [
      "/home/notoh/docker/mcserver:/data:rw"
    ];
  };
}
