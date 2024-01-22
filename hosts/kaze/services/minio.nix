{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.minio-client];

  systemd.services.minio.environment = {
    MINIO_BROWSER_REDIRECT = "false";
  };

  sops.secrets.minio = {
    owner = "minio";
    group = "minio";
    mode = "0600";
    restartUnits = ["minio.service"];
  };
  services.minio = {
    enable = true;
    region = "us-east-1";
    consoleAddress = "100.69.79.81:9006";
    listenAddress = "100.69.79.81:9005";
    rootCredentialsFile = config.sops.secrets.minio.path;
    dataDir = ["/var/lib/slab/minio/data"];
    configDir = "/var/lib/slab/minio/config";
  };
}
