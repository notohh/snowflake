_: {
  sops.secrets.immich = {};
  services.immich = {
    enable = true;
    openFirewall = true;
    host = "0.0.0.0";
    mediaLocation = "/var/lib/immich";
    secretsFile = "/run/secrets/immich";
    machine-learning.enable = true;
    redis = {
      enable = true;
    };
    database = {
      createDB = true;
    };
    settings = {
      server = {
        externalDomain = "https://immich.flake.sh";
      };
    };
  };
}
