{ pkgs, lib, ... }:
{

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${lib.getExe pkgs.tuigreet} --time --cmd niri-session";
        user = "greeter";
        vt = 1;
      };
      default_session = initial_session;
    };
  };
}
