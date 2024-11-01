{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      markdown
      nix
      regex
      toml
      xml
      yaml
      rust
      go
      gomod
    ];
    settings = {
      highlight.enable = true;
      indent.enable = false;
    };
  };
}
