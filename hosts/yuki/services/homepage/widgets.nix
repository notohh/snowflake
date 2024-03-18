_: {
  services.homepage-dashboard.widgets = [
    {
      greeting = {
        text_size = "l";
        text = "おかえりなさい！";
      };
    }
    {
      datetime = {
        text_size = "l";
        format = {
          timeStyle = "short";
          dateStyle = "short";
          hourCycle = "h23";
        };
      };
    }
    {
      openweathermap = {
        label = "New York";
        latitude = "40.730610";
        longitude = "-73.935242";
        units = "metric";
        provider = "openweathermap";
        cache = 5;
      };
    }
  ];
}
