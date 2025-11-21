_: {
  imports = [
    ./settings.nix
    ./keymap.nix
  ];
  programs.zed-editor = {
    enable = true;
    extensions = [
      # langs
      "html"
      "toml"
      "git-firefly"
      "latex"
      "svelte"
      "scss"
      "nix"
      "nu"
      "gosum"
      "scls"
      "lua"
      "mermaid"

      # misc
      "env"
      "discord-presence"
      "wakatime"

      # themes
      "tokyo-night"
      "material-icon-theme"
    ];
  };
}
