_: {
  networking.firewall.allowedTCPPorts = [7777];
  virtualisation.oci-containers.containers.terraria = {
    image = "jacobsmile/tmodloader1.4:v2023.11.3.3";
    ports = ["7777:7777"];
    volumes = ["/var/lib/terraria/tmodloader:/data"];
    environment = {
      TMOD_MOTD = "forsen";
      TMOD_PASS = "forsen";
      TMOD_AUTOSAVE_INTERVAL = "10";
      TMOD_SHUTDOWN_MESSAGE = "Server is shutting down NOW!";
      TMOD_AUTODOWNLOAD = "2824688072,2824688266,2669644269,2563309347,2619954303,2687866031,2563851005,2908170107";
      TMOD_ENABLEDMODS = "2824688072,2824688266,2669644269,2563309347,2619954303,2687866031,2563851005,2908170107";
      TMOD_MAXPLAYERS = "10";
      TMOD_WORLDNAME = "forsenv2";
      TMOD_WORLDSIZE = "3";
      TMOD_DIFFICULTY = "2";
      TMOD_NPCSTREAM = "60";
      TMOD_WORLDSEED = "random";
      TMOD_LANGUAGE = "en-US";
      TMOD_UPNP = "1";
    };
  };
}
