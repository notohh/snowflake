{pkgs, ...}: let
  treesitter-nu-grammar = pkgs.tree-sitter.buildGrammar {
    language = "nu";
    version = "0.0.0+rev=1561a94";
    src = pkgs.fetchFromGitHub {
      owner = "nushell";
      repo = "tree-sitter-nu";
      rev = "1561a947a5505d373e11ca337898e048ac2e389e";
      hash = "sha256-RAAMBVov4q8b8MJZVlf1qwbLK8hE5AxPK1IV9TMCrTs=";
    };
    meta.homepage = "https://github.com/nushell/tree-sitter-nu";
  };
in {
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
      treesitter-nu-grammar
    ];
    settings = {
      highlight.enable = true;
      indent.enable = false;
    };
  };
}
