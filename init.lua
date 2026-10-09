vim.o.winborder = "rounded"
require("config")

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"vimdoc",
		"c",
		"cpp",
		"csv",
		"elixir",
		"erlang",
		"gitcommit",
		"go",
		"heex",
		"kdl",
		"ruby",
		"rust",
		"sql",
		"typst",
		"xml",
		"zig",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
