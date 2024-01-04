{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./davfs.nix
  ];
  environment.systemPackages = [pkgs.minio-client];
  sops.secrets.minio = {
    owner = "minio";
    group = "minio";
    mode = "0600";
    restartUnits = ["minio.service"];
  };
  services.minio = {
    enable = true;
    region = "us-east-1";
    consoleAddress = "100.104.42.96:9006";
    listenAddress = "100.104.42.96:9005";
    rootCredentialsFile = config.sops.secrets.minio.path;
    dataDir = ["/var/lib/mounted/minio/data"];
    configDir = "/var/lib/mounted/minio/config";
  };
}
