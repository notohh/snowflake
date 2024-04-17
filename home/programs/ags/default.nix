{
  pkgs,
  config,
  ...
}: let
  configDir = "/home/notoh/snowflake/homeo/programs/ags/config";
in {
  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [libsoup_3 libdbusmenu-gtk3];
  };
  home.packages = with pkgs; [dart-sass];
  xdg.configFile = {
    "ags".source = config.lib.file.mkOutOfStoreSymlink "${configDir}";
  };
}
