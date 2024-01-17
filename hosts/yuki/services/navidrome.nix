_: {
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "100.108.113.89";
      Port = 4533;
      MusicFolder = "/media/music";
    };
  };
}
