_: {
  networking.firewall.allowedTCPPorts = [ 9090 ];
  services.prometheus = {
    enable = true;
    globalConfig = {
      scrape_interval = "15s";
      evaluation_interval = "15s";
    };
    scrapeConfigs = [
      {
        job_name = "prometheus";
        static_configs = [ { targets = [ "localhost:9090" ]; } ];
      }
      {
        job_name = "node";
        static_configs = [ { targets = [ "localhost:9100" ]; } ];
      }
      {
        job_name = "traefik";
        static_configs = [ { targets = [ "100.104.42.96:8080" ]; } ];
      }
      {
        job_name = "postgres";
        static_configs = [ { targets = [ "100.94.214.100:9003" ]; } ];
      }
      {
        job_name = "blocky";
        static_configs = [ { targets = [ "100.73.192.45:4000" ]; } ];
      }
      {
        job_name = "redis_exporter";
        static_configs = [ { targets = [ "100.94.214.100:9002" ]; } ];
      }
    ];
    exporters = {
      node = {
        enable = true;
        enabledCollectors = [
          "systemd"
          "cpu"
        ];
      };
    };
  };
}
