{config, ...}: {
  sops.secrets.attic-jwt-secret = {};
  services.atticd = {
    enable = true;
    credentialsFile = config.sops.secrets.attic-jwt-secret.path;
    settings = {
      listen = "[::]:8100";
      allowed-hosts = ["cache.notohh.dev"];
      api-endpoint = "https://cache.notohh.dev";
      chunking = {
        nar-size-threshold = 64 * 1024; # 64 KiB

        min-size = 16 * 1024; # 16 KiB

        avg-size = 64 * 1024; # 64 KiB

        max-size = 256 * 1024; # 256 KiB
      };
      garbage-collection = {
        interval = "12 hours";
        default-retention-period = "2 weeks";
      };
    };
  };
}
