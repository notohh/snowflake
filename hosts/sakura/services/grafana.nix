_: let
  prometheusPort = "9090";
  dbLogin = "grafana";
in {
  services.grafana = {
    enable = true;
    settings = {
      "auth.anonymous".enabled = true;
      "auth.basic".enabled = false;
      server = {
        root_url = "https://metrics.flake.sh";
        domain = "metrics.flake.sh";
        enforce_domain = true;
        http_addr = "0.0.0.0";
        http_port = 3100;
      };
      users = {
        allow_signup = false;
      };
      database = {
        type = "postgres";
        host = "192.168.1.211:5432";
        name = dbLogin;
        user = dbLogin;
        ssl_mode = "disable";
      };
      panels = {
        disable_sanitize_html = false;
        enable_alpha = true;
      };
    };
    provision = {
      datasources.settings = {
        datasources = [
          {
            name = "Prometheus";
            type = "prometheus";
            url = "http://localhost:${prometheusPort}";
            orgId = 1;
          }
          {
            name = "Prometheus-kariru";
            type = "prometheus";
            url = "http://100.126.229.95:${prometheusPort}";
            orgId = 1;
          }
          {
            name = "Prometheus-yuki";
            type = "prometheus";
            url = "http://100.108.113.89:${prometheusPort}";
            orgId = 1;
          }
          {
            name = "Prometheus-arashi";
            type = "prometheus";
            url = "http://100.94.214.100:${prometheusPort}";
            orgId = 1;
          }
          {
            name = "Prometheus-sora";
            type = "prometheus";
            url = "http://100.104.42.96:${prometheusPort}";
            orgId = 1;
          }
          {
            name = "Prometheus-tsuru";
            type = "prometheus";
            url = "http://100.82.146.40:${prometheusPort}";
            orgId = 1;
          }
          {
            name = "Prometheus-kaze";
            type = "prometheus";
            url = "http://100.69.79.81:${prometheusPort}";
            orgId = 1;
          }
          {
            name = "Prometheus-haru";
            type = "prometheus";
            url = "http://100.73.192.45:${prometheusPort}";
            orgId = 1;
            jsonData = {
              graphiteVersion = "1.1";
              tlsAuth = false;
              tlsAuthWithCACert = false;
            };
          }
        ];
      };
    };
  };
}
