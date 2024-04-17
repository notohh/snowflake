{pkgs, ...}: {
  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 3600;
      pinentryPackage = pkgs.pinentry-curses;
      enableSshSupport = true;
      enableNushellIntegration = true;
    };
  };
}
