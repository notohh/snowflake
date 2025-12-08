require("cord").setup({
	text = {
		editing = function(opts)
			return string.format("Editing %s %s:%s", opts.filename, opts.cursor_line, opts.cursor_char)
		end,
	},
	buttons = {
		{
			label = "View Repository",
			url = function(opts)
				return opts.repo_url
			end,
		},
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
require("trouble").setup({
	{
		modes = {
			preview_float = {
				mode = "diagnostics",
				preview = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, -2 },
					size = { width = 0.3, height = 0.3 },
					zindex = 200,
				},
			},
		},
	},
})

require("nvchad.configs.lspconfig").defaults()

local servers = { "nil_ls", "lua_ls", "rust_analyzer", "qmlls", "marksman" }

vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			workspace = {
				ignoreDir = {
					".direnv",
				},
				runtime = {
					version = "LuaJIT",
				},
			},
		},
	},
})

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1

	if directory then
		vim.cmd.cd(data.file)
		require("nvim-tree.api").tree.open()
		return
	end

	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.diagnostic.config({
	update_in_insert = true,
})
