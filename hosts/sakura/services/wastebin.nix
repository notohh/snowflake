_: {
  services.wastebin = {
    enable = true;
    settings = {
      WASTEBIN_TITLE = "wastebin";
      WASTEBIN_BASE_URL = "https://paste.flake.sh";
    };
  };
}
