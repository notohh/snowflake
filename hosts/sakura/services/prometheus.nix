_: {
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "prometheus";
        scrape_interval = "30s";
        static_configs = [{targets = ["127.0.0.0:9090"];}];
      }
      {
        job_name = "node";
        scrape_interval = "30s";
        static_configs = [{targets = ["127.0.0.0:9100"];}];
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
