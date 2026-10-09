return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		require("tiny-inline-diagnostic").setup({
			-- Options such as styling, and handling overflow wrapping are built-in
			preset = "powerline",
			show_code = false,
			use_icons_from_diagnostic = true,
			enable_on_insert = true,
		})
	end,
}
