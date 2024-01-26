vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.nix", "*.rs", "*.go" }

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- -- Change theme settings
lvim.colorscheme = "tokyonight"
lvim.transparent_window = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.auto_install = true


-- plugins

lvim.plugins = {
  {
    "andweeb/presence.nvim",
    config = function() require("user.presence").config() end
  },
  {
    "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function() require("spectre").setup() end
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "alejandra",
    command = "alejandra",
    args = { "--quiet" },
    filetypes = { "nix" }
  }
}

local function open_nvim_tree() require("nvim-tree.api").tree.open() end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
