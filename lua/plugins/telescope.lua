return {
	"nvim-telescope/telescope.nvim",
	--    branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"princejoogie/dir-telescope.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-Down>"] = actions.cycle_history_next,
						["<C-Up>"] = actions.cycle_history_prev,
					},
				},
			},
			extensions = {
				frecency = {
					show_unindexed = false,
					default_workspace = "CWD",
					enable_prompt_mappings = true,
					ignore_patterns = { "/.git", "*/.git/*", "*/.DS_Store", "**/node_modules/**", "**/deps/**" },
					workspaces = {
						src = "src/",
						test = "test/",
						lib = "lib/",
						doc = "doc/",
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("dir")
		telescope.load_extension("frecency")

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { desc = "Find string in directory" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
		keymap.set("n", "<leader>fp", "<cmd>Telescope frecency<CR>", { desc = "Find files used frecency" })
		keymap.set("n", "<leader>tr", "<cmd>Telescope resume<CR>", { desc = "Telescope resume" })
	end,
}
