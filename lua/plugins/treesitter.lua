return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").setup({
			-- Directory to install parsers and queries to (prepend to 'runtimepath' to have priority)
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		require("nvim-treesitter").install({
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
			"python",
		})
	end,
}
