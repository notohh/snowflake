{pkgs, ...}: {
  services.vaultwarden = {
    enable = true;
    package = pkgs.vaultwarden-postgresql;
    dbBackend = "postgresql";
    config = {
      SIGNUPS_ALLOWED = true;
      DATABASE_URL = "postgresql://vaultwarden:vaultwarden@192.168.1.211:5432/vaultwarden";
      LOG_LEVEL = "Info";
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
    };
  };
}
