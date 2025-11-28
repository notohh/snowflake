{ pkgs, ... }:
{
  imports = [
    ./settings.nix
    ./keymap.nix
  ];
  home.packages = [ pkgs.zed-discord-presence ];
  programs.zed-editor = {
    enable = true;
    mutableUserSettings = false;
    extensions = [
      # langs
      "toml"
      "git-firefly"
      "scss"
      "nix"
      "nu"
      "gosum"
      "lua"
      "mermaid"
      "editorconfig"
      "just"

      # misc
      "env"
      "discord-presence"

      # themes
      "one-dark-pro-enhanced"
      "material-icon-theme"
    ];
  };
}
