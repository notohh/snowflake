_: {
  sops.secrets.redbot-auth = {};
  virtualisation.oci-containers.containers.redbot = {
    image = "phasecorex/red-discordbot";
    environment = {
      OWNER = "155965294429470720";
      PREFIX = "*";
      TZ = "America/New_York";
      PUID = "1000";
    };
    environmentFiles = [
      /run/secrets/redbot-auth
    ];
    volumes = ["/home/notoh/docker/redbot:/data"];
  };
}
