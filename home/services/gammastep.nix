_: {
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = "40.730610";
    longitude = "-73.935242";
    dawnTime = "6:00-7:00";
    duskTime = "18:00-20:15";
    temperature.day = 5500;
    temperature.night = 3000;
  };
}
