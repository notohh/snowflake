_: {
  services.beszel.hub = {
    enable = true;
    host = "0.0.0.0";
    port = 3002;
    environment = {
      AUTO_LOGIN = "true";
      DISABLE_PASSWORD_AUTH = "false";
      SHARE_ALL_SYSTEMS = "true";
    };
  };
}
