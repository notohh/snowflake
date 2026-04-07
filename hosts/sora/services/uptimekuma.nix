_: {
  services.uptime-kuma = {
    enable = true;
    settings =
      let
        PORT = "4000";
      in
      {
        inherit PORT;
        HOST = "100.104.42.96";
      };
  };
}
