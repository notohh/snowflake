{
  pkgs,
  config,
  lib,
  ...
}: {
  sops.secrets.paperless-pwd = {
    owner = "paperless";
    group = "paperless";
  };

  systemd.services = {
    paperless-task-queue.serviceConfig = {PrivateNetwork = false;};
    paperless-scheduler.serviceConfig = {PrivateNetwork = lib.mkForce false;};
  };

  services.paperless = let
    dataDir = "/var/lib/paperless-ngx";
  in {
    package = pkgs.paperless-ngx;
    enable = true;
    address = "0.0.0.0";
    port = 28981;
    passwordFile = config.sops.secrets.paperless-pwd.path;
    dataDir = "${dataDir}";
    mediaDir = "${dataDir}/media";
    consumptionDir = "${dataDir}/consume";
    settings = {
      PAPERLESS_ADMIN_USER = "notoh";
      PAPERLESS_REDIS = "redis://:paperless-ngx@192.168.1.211:6382";
      PAPERLESS_EMAIL_TASK_CRON = "*/5 * * * *";
    };
  };
}
