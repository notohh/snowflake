{
  config,
  lib,
  ...
}: {
  sops.secrets.miniflux = {};

  services.miniflux = {
    enable = true;
    adminCredentialsFile = config.sops.secrets.miniflux.path;
    config = {
      LISTEN_ADDR = "0.0.0.0";
      PORT = 9000;
      BASE_URL = "https://rss.internal.flake.sh";
      HTTPS = "true";
      DATABASE_URL = lib.mkForce "host=100.94.214.100 port=5432 user=miniflux password=miniflux dbname=miniflux sslmode=disable";
    };
  };
}
