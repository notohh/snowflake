{
  inputs,
  pkgs,
  ...
}: {
  programs.atuin = {
    enable = true;
    package = inputs.atuin.packages.${pkgs.system}.default;
    enableNushellIntegration = true;
    settings = {
      auto_sync = true;
      update_check = true;
      sync_frequency = "1h";
      sync_address = "http://100.104.42.96:8888";
      secrets_filter = true;
      style = "full";
    };
    flags = ["--disable-up-arrow"];
  };
}
