{config, ...}: {
  sops.secrets.attic-secret = {};

  services.atticd = {
    enable = true;
    credentialsFile = "/etc/attic/atticd.env";
    settings = {
      listen = "[::]:8100";
      allowed-hosts = ["cache.notohh.dev"];
      database.url = "postgres://atticd:atticd@192.168.1.211:5432/atticd";
      api-endpoint = "https://cache.notohh.dev/";
      require-proof-of-possession = false;
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
