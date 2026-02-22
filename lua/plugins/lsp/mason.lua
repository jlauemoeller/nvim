return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"cssls",
				"css_variables",
				"cssmodules_ls",
				"expert", -- elixir, also try elixir-ls, lexical, expert
				"jsonls",
				"lua_ls",
				"markdown_oxide",
				"postgres_lsp",
				"tailwindcss",
				"ts_ls",
				"yamlls",
				"rust_analyzer",
			},
			automatic_enable = {
				exclude = {
					"rust_analyzer",
				},
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "",
							package_pending = "",
							package_uninstalled = "",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
			opts = {
				diagnostics = {
					virtual_text = false,
				},
				servers = {
					["*"] = {
						keys = {
							{ "K", false },
						},
					},
				},
			},
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint_d",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
