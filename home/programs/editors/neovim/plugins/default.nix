_: {
  imports = [
    ./editor/neotree.nix
    ./editor/trouble.nix
    ./editor/autoclose.nix
    ./editor/bufferline.nix
    ./editor/autosave.nix
    ./editor/treesitter.nix
    ./editor/guessindent.nix
    ./editor/luasnip.nix
    ./editor/cmp.nix
    ./lsp/lsp.nix
    ./lsp/conform.nix
    ./misc/wakatime.nix
    ./misc/direnv.nix
    ./misc/presence.nix
    ./misc/lazygit.nix
    ./misc/vimbbye.nix
    ./ui/lualine.nix
    ./ui/mini.nix
    ./ui/transparent.nix
    ./ui/telescope.nix
    ./ui/fidget.nix
    ./ui/dashboard.nix
    ./ui/toggleterm.nix
  ];
  programs.nixvim.plugins.web-devicons.enable = true;
}
