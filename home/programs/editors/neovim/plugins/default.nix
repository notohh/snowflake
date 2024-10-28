_: {
  imports = [
    ./editor/neotree.nix
    ./editor/trouble.nix
    ./editor/autoclose.nix
    ./editor/bufferline.nix
    ./editor/autosave.nix
    ./editor/treesitter.nix
    ./lsp/lsp.nix
    ./lsp/conform.nix
    ./misc/wakatime.nix
    ./misc/direnv.nix
    ./misc/presence.nix
    ./ui/lualine.nix
    ./ui/mini.nix
    ./ui/transparent.nix
    ./ui/telescope.nix
  ];
  programs.nixvim.plugins.web-devicons.enable = true;
}
