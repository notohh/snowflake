{ inputs, ... }:
{
  imports = [ inputs.walker.homeManagerModules.default ];
  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      providers.default = [
        "desktopapplications"
      ];
    };
  };
}
