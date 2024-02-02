{
  pkgs,
  config,
  ...
}: {
  sops.secrets.vaultwarden-env = {};
  services.vaultwarden = {
    enable = true;
    package = pkgs.vaultwarden-postgresql;
    dbBackend = "postgresql";
    config = {
      DOMAIN = "https://vault.flake.sh/";
      SIGNUPS_ALLOWED = false;
      DATABASE_URL = "postgresql://vaultwarden:vaultwarden@192.168.1.211:5432/vaultwarden";
      LOG_LEVEL = "Info";
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
      # mailer
      SMTP_HOST = "mail.smtp2go.com";
      SMTP_PORT = 587;
      SMTP_SECURITY = "starttls";
      SMTP_FROM = "vault@flake.sh";
      SMTP_FROM_NAME = "Vaultwarden";
      SMTP_USERNAME = "vaultwarden-mailer";
      SMTP_TIMEOUT = 15;
    };
    environmentFile = config.sops.secrets.vaultwarden-env.path;
  };
}
