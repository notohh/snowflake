_: {
  services.komga = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        port = 8081;
      };
    };
  };
}
