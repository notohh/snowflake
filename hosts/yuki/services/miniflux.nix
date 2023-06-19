{
  config,
  lib,
  ...
}: {
  networking.firewall.allowedTCPPorts = [8200];
  sops.secrets.miniflux = {};
  services.miniflux = {
    enable = true;
    config = {
      DATABASE_URL = lib.mkForce "host=192.168.1.211 port=5432 user=miniflux password=miniflux dbname=miniflux sslmode=disable";
      LISTEN_ADDR = "localhost:8200";
    };
    adminCredentialsFile = config.sops.secrets.miniflux.path;
  };
}
