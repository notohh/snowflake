{config, ...}: {
  networking.firewall.allowedTCPPorts = [9091];
  sops.secrets.authelia-jwt = {owner = config.systemd.services.authelia-default.serviceConfig.User;};
  sops.secrets.authelia-sek = {owner = config.systemd.services.authelia-default.serviceConfig.User;};
  services.authelia.instances.default = {
    enable = true;
    secrets = {
      jwtSecretFile = config.sops.secrets.authelia-jwt.path;
      storageEncryptionKeyFile = config.sops.secrets.authelia-sek.path;
    };
    settings = {
      log.level = "debug";
      theme = "dark";
      default_2fa_method = "totp";
      default_redirection_url = "https://passport.notohh.dev/";
      authentication_backend = {
        file.path = "/var/lib/authelia-default/user.yml";
      };
      session = {
        domain = "notohh.dev";
        expiration = 3600;
        inactivity = 300;
      };
      totp = {
        issuer = "authelia.com";
        disable = false;
        algorithm = "sha1";
        digits = 6;
        period = 30;
        skew = 1;
        secret_size = 32;
      };
      server = {
        host = "0.0.0.0";
        port = 9091;
      };
      access_control = {
        default_policy = "deny";
        rules = [
          {
            domain = "notohh.dev";
            policy = "bypass";
          }
        ];
      };
      regulation = {
        max_retries = 3;
        find_time = 120;
        ban_time = 300;
      };
      notifier.filesystem = {
        filename = "/var/lib/authelia-default/notif.txt";
      };
      storage.postgres = {
        host = "192.168.1.211";
        port = 5432;
        database = "authelia";
        schema = "public";
        username = "authelia";
        password = "authelia";
      };
    };
  };
}
