{pkgs, ...}: {
  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 3600;
      pinentry.package = pkgs.pinentry-curses;
      enableSshSupport = true;
      enableNushellIntegration = true;
    };
  };
}
