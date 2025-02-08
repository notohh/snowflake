_: {
  services.home-assistant.config = {
    lovelace.mode = "yaml";
    http = {
      server_host = "0.0.0.0";
      server_port = 8123;
    };
    homeassistant = {
      name = "Home";
      time_zone = "America/New_York";
      unit_system = "us_customary";
      temperature_unit = "F";
      currency = "USD";
      country = "US";
    };
    default_config = {};
  };
}
