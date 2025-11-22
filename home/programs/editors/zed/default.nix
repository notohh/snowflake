_: {
  imports = [
    ./settings.nix
    ./keymap.nix
  ];
  programs.zed-editor = {
    enable = true;
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
      "tokyo-night"
      "material-icon-theme"
    ];
  };
}
