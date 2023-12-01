_: {
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
        name = "grafana";
        user = "grafana";
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
            url = "http://100.104.42.96:9090";
            orgId = 1;
          }
          {
            name = "Prometheus-haru";
            type = "prometheus";
            url = "http://100.73.192.45:9090";
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
