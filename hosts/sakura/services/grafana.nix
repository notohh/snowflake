_: {
  services.grafana = {
    enable = true;
    settings = {
      server = {
        root_url = "https://metrics.flake.sh";
        domain = "metrics.flake.sh";
        enforce_domain = true;
        http_addr = "0.0.0.0";
        http_port = 3100;
      };
      "auth.anonymous".enabled = true;
      "auth.basic".enabled = false;
      users = {
        allow_signup = false;
      };
      database = {
        type = "postgres";
        host = "192.168.1.211:5432";
        name = "grafana";
        user = "grafana";
        ssl_mode = "disable";
      };
    };
    provision = {
      datasources.settings = {
        datasources = [
          {
            name = "Prometheus";
            type = "prometheus";
            url = "http://localhost:9090";
            orgId = 1;
          }
          {
            name = "Prometheus-kariru";
            type = "prometheus";
            url = "http://192.168.1.54:9090";
            orgId = 1;
          }
          {
            name = "Prometheus-yuki";
            type = "prometheus";
            url = "http://192.168.1.36:9090";
            orgId = 1;
          }
          {
            name = "Prometheus-arashi";
            type = "prometheus";
            url = "http://192.168.1.211:9090";
            orgId = 1;
          }
          {
            name = "Prometheus-sora";
            type = "prometheus";
            url = "http://100.87.54.48:9090";
            orgId = 1;
          }
        ];
      };
    };
  };
}
