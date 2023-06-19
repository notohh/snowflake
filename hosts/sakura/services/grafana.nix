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
        auto_assign_org = true;
        auto_assign_org_role = "Viewer";
      };
      database = {
        type = "postgres";
        host = "192.168.1.211:5432";
        name = "grafana";
        user = "grafana";
        password = "grafana";
        ssl_mode = "disable";
      };
    };
    provision = {
      datasources.settings = {
        datasources = [
          {
            name = "Prometheus";
            type = "prometheus";
            url = "http://127.0.0.0:9090";
            orgId = 1;
          }
        ];
      };
    };
  };
}
