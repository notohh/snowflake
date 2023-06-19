_: {
  services.grafana = {
    enable = true;
    settings = {
      server = {
        root_url = "https://metrics.notohh.dev";
        domain = "metrics.notohh.dev";
        enforce_domain = true;
        http_addr = "0.0.0.0";
        http_port = 3100;
      };
      auth = {
        disable_login_form = false;
      };
      users = {
        allow_signup = false;
      };
      feature_toggles = {
        publicDashboards = true;
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
        ];
      };
    };
  };
}
