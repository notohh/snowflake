{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      marksman
      nil
      nixfmt
    ];
    extraPlugins = builtins.readFile ./plugins.lua;
    extraConfig = builtins.readFile ./config.lua;
    hm-activation = true;
    backup = true;
  };
}
