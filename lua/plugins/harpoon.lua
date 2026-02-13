local conf = require("telescope.config").values
local themes = require("telescope.themes")

-- helper function to use telescope on harpoon list.
-- change get_icy to other themes if wanted
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end
	local opts = themes.get_ivy({
		prompt_title = "Working List",
	})

	require("telescope.pickers")
		.new(opts, {
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local keymap = vim.keymap

		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)
		keymap.set("n", "<leader>hl", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end)
		keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end)
		keymap.set("n", "<leader>hf", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
