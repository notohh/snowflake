{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."yazi/init.lua".source = ./init.lua;
  # imports = [./keymap.nix];
  home.packages = [pkgs.exiftool];

  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableNushellIntegration = true;
    settings = {
      manager = {
        ratio = [1 3 2];
        sort_by = "natural";
        sort_reverse = false;
        sort_dir_first = true;
        show_hidden = true;
        show_symlink = true;
        linemode = "size";
      };
      preview = {
        cache_dir = "${config.xdg.cacheHome}";
        max_height = 900;
        max_width = 600;
      };
      open.rules = [
        {
          mime = "image/*";
          use = ["image"];
        }
      ];
      opener = {
        image = [
          {
            exec = ''imv "$@" '';
            block = true;
            for = "linux";
          }
        ];
      };
      log.enable = false;
    };
  };
}
