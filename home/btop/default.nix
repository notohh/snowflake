{
  ...
}: {
  programs.btop = {
    enable = true;
    settings = {
        color_theme = "/home/notoh/.config/btop/themes/catppuccin_mocha.theme";
        theme_background = false;
        truecolor = true;
        rounded_corners = true;
        show_cpu_freq = true;
        show_swap = true;
        swap_disk = true;
        show_disks = true;
        only_physical = true;
        use_fstab = true;
    };
  };
  xdg.configFile."btop/themes/catppuccin_mocha.theme".source = ./catppuccin_mocha.theme;
}