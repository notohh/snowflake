{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.minio-client];

  systemd.services.minio.environment = {MINIO_BROWSER_REDIRECT = "false";};

  sops.secrets.minio = {
    owner = "minio";
    group = "minio";
    mode = "0600";
    restartUnits = ["minio.service"];
  };
  services.minio = let
    dataDir = "/var/lib/slab/minio";
  in {
    enable = true;
    region = "us-east-1";
    consoleAddress = "0.0.0.0:9006";
    listenAddress = "0.0.0.0:9005";
    rootCredentialsFile = config.sops.secrets.minio.path;
    dataDir = ["${dataDir}/data"];
    configDir = "${dataDir}/config";
  };
}
