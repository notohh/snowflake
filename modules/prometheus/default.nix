_: {
  networking.firewall.allowedTCPPorts = [9090];
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "prometheus";
        scrape_interval = "15s";
        static_configs = [{targets = ["localhost:9090"];}];
      }
      {
        job_name = "node";
        scrape_interval = "15s";
        static_configs = [{targets = ["localhost:9100"];}];
      }
      {
        job_name = "traefik";
        scrape_interval = "15s";
        static_configs = [{targets = ["100.87.54.48:8080"];}];
      }
      {
        job_name = "redis_exporter";
        scrape_interval = "15s";
        static_configs = [{targets = ["100.94.214.100:9002"];}];
      }
      {
        job_name = "postgres";
        scrape_interval = "15s";
        static_configs = [{targets = ["100.94.214.100:9003"];}];
      }
    ];
    exporters = {
      node = {
        enable = true;
        enabledCollectors = ["systemd" "cpu"];
      };
    };
  };
}