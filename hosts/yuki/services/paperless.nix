{
  pkgs,
  config,
  ...
}: {
  sops.secrets.paperless-pwd = {
    owner = "paperless";
    group = "paperless";
  };
  services.paperless = let
    dataDir = "/var/lib/paperless-ngx";
  in {
    package = pkgs.paperless-ngx;
    enable = true;
    address = "100.108.113.89";
    port = 28981;
    passwordFile = config.sops.secrets.paperless-pwd.path;
    dataDir = "${dataDir}";
    mediaDir = "${dataDir}/media";
    consumptionDir = "${dataDir}/consume";
    settings = {
      PAPERLESS_ADMIN_USER = "notoh";
      PAPERLESS_REDIS = "redis://:paperless-ngx@100.94.214.100:6382";
    };
  };
}
