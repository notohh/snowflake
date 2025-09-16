_: {
  services.home-assistant.lovelaceConfig = {
    title = "Home";
    views = [
      {
        title = "Home";
        icon = "mdi:home";
        cards = [
          {
            type = "markdown";
            title = "Lovelace";
            content = "Welcome home!";
          }
          {
            type = "weather-forecast";
            entity = "weather.openweathermap";
            forecast_type = "hourly";
          }
        ];
      }
      {
        title = "Living Room";
        cards = [
          {
            type = "light";
            entity = "light.living_room";
            tap_action = {
              action = "toggle";
            };
            hold_action = {
              action = "Default action";
            };
            style = {
              top = "72.8%";
              left = "75.3%";
            };
          }
          {
            type = "light";
            entity = "light.hall_light";
            tap_action = {
              action = "toggle";
            };
            hold_action = {
              action = "Default action";
            };
            style = {
              top = "72.8%";
              left = "75.3%";
            };
          }
        ];
      }
      {
        title = "Master Bedroom";
        cards = [
          {
            type = "light";
            entity = "light.master_bedroom_lamp";
            tap_action = {
              action = "toggle";
            };
            hold_action = {
              action = "Default action";
            };
            style = {
              top = "72.8%";
              left = "75.3%";
            };
          }
        ];
      }
      {
        title = "Bedroom 1";
        cards = [
          {
            type = "light";
            entity = "light.bedroom_1";
            show_state = true;
            show_icon = true;
            tap_action = {
              action = "toggle";
            };
            hold_action = {
              action = "Default action";
            };
            style = {
              top = "72.8%";
              left = "75.3%";
            };
          }
          {
            type = "light";
            entity = "light.light_panels_58_6c_84";
            show_state = true;
            show_icon = true;
            tap_action = {
              action = "toggle";
            };
            hold_action = {
              action = "Default action";
            };
            style = {
              top = "72.8%";
              left = "75.3%";
            };
          }
          {
            type = "entities";
            entities = [
              "light.hue_color_lamp_1"
              "light.hue_color_lamp_2"
              "light.hue_lightstrip_plus_1"
              "light.light_panels_58_6c_84"
            ];
            style = {
              top = "72.8%";
              left = "75.3%";
            };
          }
        ];
      }
      {
        title = "Bedroom 2";
        cards = [
        ];
      }
    ];
  };
}
