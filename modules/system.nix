{
  ...
}: {

   documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  services = {
    fstrim = {
      enable = true;
    };
  };
  
  time.timeZone = "America/New_York";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
     LC_ADDRESS = "en_US.UTF-8";
     LC_IDENTIFICATION = "en_US.UTF-8";
     LC_MEASUREMENT = "en_US.UTF-8";
     LC_MONETARY = "en_US.UTF-8";
     LC_NAME = "en_US.UTF-8";
     LC_NUMERIC = "en_US.UTF-8";
     LC_PAPER = "en_US.UTF-8";
     LC_TELEPHONE = "en_US.UTF-8";
     LC_TIME = "en_US.UTF-8";
   };
 };
  
  systemd.services.systemd-udevd.restartIfChanged = false;

  system.autoUpgrade.enable = false;
  system.stateVersion = "23.05"; # no touchy
  
}