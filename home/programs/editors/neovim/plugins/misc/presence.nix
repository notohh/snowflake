{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      cord-nvim
    ];
    extraConfigLua = ''
      require('cord').setup {
        editor = {
          tooltip = 'Neovim'
        },
        display = {
          show_time = true,
          show_repository = true,
          show_cursor_position = true,
        },
        lsp = {
          show_problem_count = true,
          severity = 1,
          scope = 'workspace',
        },
        buttons = {
          {
            label = 'View Repository',
            url = 'git',
          },
        },
      }
    '';
  };
}
