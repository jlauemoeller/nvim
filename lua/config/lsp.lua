local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show references" })
		keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show definitions" })
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show implementations" })
		keymap.set("n", "gt", "<dms>Telescope lsp_type_definitions<CR>", { desc = "Show type definitions" })
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" })
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
		keymap.set("n", "dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
		keymap.set("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to prev diagnostic" })
		keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "single",
				max_height = 25,
				max_width = 120,
			})
		end, { desc = "Show documentation for what's under the cursor" })
		keymap.set("n", "di", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle display of inline hints" })
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
	end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	-- Change the diagnostic symbols in the sign column (gutter)
	signs = {
		text = {
			[severity.ERROR] = "󰅙 ",
			[severity.WARN] = " ",
			[severity.HINT] = " ",
			[severity.INFO] = " ",
		},
	},
	update_in_insert = false,
	virtual_text = {
		spacing = 2,
		prefix = "",
	},
	underline = true,
	virtual_lines = false,
	float = {
		border = "rounded",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			hint = { enable = true },
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			inlayHints = {
				chainingHints = { enable = true },
				closingBraceHints = { enable = true, minLines = 25 },
				parameterHints = { enable = true },
				typeHints = { enable = true },
			},
		},
	},
})

vim.lsp.config("ts_ls", {
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

local _border = "rounded" -- or "single", "double"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = _border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = _border,
})
