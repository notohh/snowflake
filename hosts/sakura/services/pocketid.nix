{ config, ... }:
{
  sops.secrets.pocketid-env = {
    owner = "pocket-id";
  };
  services.pocket-id = {
    enable = true;
    user = "pocket-id";
    environmentFile = config.sops.secrets.pocketid-env.path;
    settings = {
      TRUST_PROXY = true;
      APP_URL = "https://passport.notohh.dev";
      ANALYTICS_DISABLED = true;
      ALLOW_USER_SIGNUPS = "disabled";
      UI_CONFIG_DISABLED = true;
      ALLOW_OWN_ACCOUNT_EDIT = true;
      DB_PROVIDER = "postgres";
      DB_CONNECTION_STRING = "postgres://pocketid:pocketid@192.168.1.211:5432/pocketid";
      KEYS_STORAGE = "database";
      SMTP_HOST = "mail.smtp2go.com";
      SMTP_PORT = 587;
      SMTP_FROM = "passport@flake.sh";
      SMTP_USER = "pocketid-mailer";
      SMTP_TLS = "starttls";
      EMAIL_LOGIN_NOTIFICATION_ENABLED = true;
      EMAIL_API_KEY_EXPIRATION_ENABLED = true;
      EMAIL_ONE_TIME_ACCESS_AS_ADMIN_ENABLED = true;
    };
  };
}
