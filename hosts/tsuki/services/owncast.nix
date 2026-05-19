_: {
  services.owncast = {
    enable = true;
    openFirewall = true;
    listen = "0.0.0.0";
    port = 8100;
    rtmp-port = 1935;
  };
}
