{
  inputs,
  pkgs,
  config,
  ...
}:
{
  # xdg.configFile."yazi/init.lua".source = ./init.lua;
  imports = [
    ./keymap.nix
    ./openers.nix
  ];

  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableNushellIntegration = true;
    settings = {
      manager = {
        ratio = [
          1
          3
          3
        ];
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
      log.enable = false;
    };
  };
}
