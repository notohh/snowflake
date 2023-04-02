{
  ...
}: {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "notoh";
      };
      default_session = initial_session;
    };
  };
}


