{
  lib,
  config,
  ...
}: {
  sops.secrets.smtp2go-pwd = {owner = "forgejo";};
  networking.firewall.allowedTCPPorts = [2222];
  services.forgejo = {
    enable = true;
    stateDir = "/var/lib/forgejo";
    settings = {
      service.DISABLE_REGISTRATION = true;
      DEFAULT.APP_NAME = "forgejo";
      log.LEVEL = "Debug";
      ui = {
        DEFAULT_THEME = "forgejo-dark";
        SHOW_USER_EMAIL = true;
      };
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "https://code.forgejo.org";
      };
      server = {
        HTTP_PORT = 3200;
        DOMAIN = "git.flake.sh";
        ROOT_URL = "https://git.flake.sh";
        LANDING_PAGE = "/explore/repos";
        START_SSH_SERVER = true;
        SSH_DOMAIN = "git.flake.sh";
        SSH_PORT = 2222;
        SSH_LISTEN_PORT = 2222;
        SSH_LISTEN_HOST = "100.121.201.47";
      };
      session = {
        COOKIE_SECURE = true;
      };
      security = {
        LOGIN_REMEMBER_DAYS = 14;
      };
      database = {
        DB_TYPE = lib.mkForce "postgres";
        HOST = "192.168.1.211:5432";
        NAME = "forgejo";
        USER = "forgejo";
        PASSWD = "forgejo";
      };
      cache = {
        ENABLED = true;
        ADAPTER = lib.mkForce "redis";
        HOST = "redis://:forgejo@100.94.214.100:6379";
      };
      metrics = {
        ENABLED = true;
        ENABLED_ISSUE_BY_REPOSITORY = true;
        ENABLED_ISSUE_BY_LABEL = true;
      };
      mailer = {
        ENABLED = true;
        FROM = "forgejo@flake.sh";
        PROTOCOL = "smtp+starttls";
        SMTP_ADDR = "mail.smtp2go.com";
        SMTP_PORT = 587;
        USER = "forgejo-mailer";
      };
    };
    mailerPasswordFile = config.sops.secrets.smtp2go-pwd.path;
  };
  services.fail2ban.jails.forgejo = {
    settings = {
      filter = "forgejo";
      action = ''iptables-allports'';
      mode = "aggressive";
      maxretry = 3;
      findtime = 3600;
      bantime = 900;
    };
  };
  environment.etc = {
    "fail2ban/filter.d/forgejo.conf".text = ''
      [Definition]
      failregex = ^.*(Failed authentication attempt|invalid credentials|Attempted access of unknown user).* from <HOST>$
      journalmatch = _SYSTEMD_UNIT=forgejo.service
    '';
  };
}
