{
  config,
  lib,
  ...
}: {
  networking.firewall.allowedTCPPorts = [9000];

  sops.secrets.miniflux = {};

  services.miniflux = {
    enable = true;
    adminCredentialsFile = config.sops.secrets.miniflux.path;
    config = {
      LISTEN_ADDR = "0.0.0.0";
      PORT = 9000;
      DATABASE_URL = lib.mkForce "host=192.168.1.211 port=5432 user=miniflux password=miniflux dbname=miniflux sslmode=disable";
    };
  };
}
