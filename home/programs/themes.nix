{pkgs, ...}: {
  catppuccin.kvantum = {
    enable = true;
    apply = true;
    flavor = "mocha";
    accent = "pink";
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  gtk = {
    enable = true;
    font = {
      name = "Inter";
      package = pkgs.google-fonts.override {fonts = ["Inter"];};
      size = 12;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
