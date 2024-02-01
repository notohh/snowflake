_: {
  time.timeZone = "America/New_York";

  services = {
    chrony = {
      enable = true;
      servers = [
        # 0.us.pool.ntp.org
        "134.215.114.62"
        "192.189.65.187"
        "96.245.170.99"
        "192.92.6.30"
      ];
    };
    timesyncd = {
      enable = true;
      servers = [
        # 0.us.pool.ntp.org
        "134.215.114.62"
        "192.189.65.187"
        "96.245.170.99"
        "192.92.6.30"
      ];
    };
  };
}
