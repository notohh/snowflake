{...}: {
  networking.firewall.allowedTCPPorts = [25565];
  virtualisation.oci-containers.containers.minecraft = {
    image = "als3bas/zulu-purpurmc:latest";
    ports = ["25565:25565"];
    environment = {
      MEMORYSIZE = "10G";
    };
    volumes = [
      "/home/notoh/docker/purpur:/data:rw"
    ];
  };
}
