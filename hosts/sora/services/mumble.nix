_: {
  services.murmur = {
    enable = true;
    openFirewall = true;
    bandwidth = 128000;
    imgMsgLength = 0;
    textMsgLength = 0;
    stateDir = "/var/lib/mumble";
  };
}
