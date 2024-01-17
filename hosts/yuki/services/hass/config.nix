_: {
  services.home-assistant.config = {
    lovelace.mode = "yaml";
    http = {
      server_host = "192.168.1.98";
      server_port = 8124;
    };
    homeassistant = {
      name = "Home";
      time_zone = "America/New_York";
      unit_system = "imperial";
      temperature_unit = "F";
      currency = "USD";
      country = "US";
    };
    default_config = {};
  };
}
