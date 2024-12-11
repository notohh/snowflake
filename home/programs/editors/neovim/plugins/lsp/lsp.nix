_: {
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp-lines.enable = true;
    lint = {
      lintersByFt = {
        nix = [
          "statix"
        ];
      };
      linters = {
        statix = {
          cmd = ["statix"];
        };
      };
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nil_ls = {
          enable = true;
        };
        rust_analyzer = {
          enable = true;
          autostart = true;
          installCargo = true;
          installRustc = true;
        };
        gopls = {
          enable = true;
          autostart = true;
        };
        nushell = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
      };
    };
  };
}
