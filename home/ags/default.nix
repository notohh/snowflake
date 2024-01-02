{
  pkgs,
  config,
  ...
}: let
  configDir = "/home/notoh/snowflake/home/ags/config";
in {
  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [libsoup_3];
  };
  home.packages = with pkgs; [dart-sass];
  xdg.configFile = {
    "ags".source = config.lib.file.mkOutOfStoreSymlink "${configDir}";
  };
}
