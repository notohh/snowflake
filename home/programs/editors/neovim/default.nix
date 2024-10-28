{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./themes
  ];
  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;
    autoGroups = {
      vim_enter = {};
    };
    highlightOverride = {
      LspInlayHint.bg = "";
    };
    autoCmd = [
      {
        group = "vim_enter";
        event = ["VimEnter"];
        pattern = "*";
        command = "Neotree";
      }
    ];
    extraConfigLua = ''
      vim.wo.relativenumber = true
    '';
    extraConfigLuaPre = ''
      local slow_format_filetypes = {}

      vim.api.nvim_create_user_command("FormatDisable", function(args)
         if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
      vim.api.nvim_create_user_command("FormatToggle", function(args)
        if args.bang then
          -- Toggle formatting for current buffer
          vim.b.disable_autoformat = not vim.b.disable_autoformat
        else
          -- Toggle formatting globally
          vim.g.disable_autoformat = not vim.g.disable_autoformat
        end
      end, {
        desc = "Toggle autoformat-on-save",
        bang = true,
      })
    '';
  };
}
