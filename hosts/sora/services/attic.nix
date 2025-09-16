{
  config,
  pkgs,
  ...
}:
{
  sops.secrets.attic = { };

  environment.systemPackages = [ pkgs.attic-client ];

  services.atticd = {
    enable = true;
    environmentFile = config.sops.secrets.attic.path;
    settings = {
      listen = "[::]:8200";
      allowed-hosts = [ "cache.flake.sh" ];
      database.url = "postgres://attic:attic@100.94.214.100:5432/attic";
      api-endpoint = "https://cache.flake.sh/";
      require-proof-of-possession = false;
      chunking = {
        nar-size-threshold = 0;

        min-size = 16 * 1024; # 16 KiB

        avg-size = 64 * 1024; # 64 KiB

        max-size = 256 * 1024; # 256 KiB
      };
      garbage-collection = {
        interval = "12 hours";
        default-retention-period = "36 weeks";
      };
      compression = {
        type = "zstd";
        level = 9;
      };
      storage = {
        type = "s3";
        region = "us-east-1";
        bucket = "kyasshu";
        endpoint = "https://s3.wasabisys.com";
      };
    };
  };
}
