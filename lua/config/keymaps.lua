vim.g.mapleader = " "

local keymap = vim.keymap
local utils = require("utils")
local bo = vim.bo
local feedkeys = utils.feedkeys

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("i", "<S-Tab>", "<C-d>", { desc = "Outdent line" })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })
keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
keymap.set("v", "A-k", "<cmd>m '<-2<CR>gv=gv", { desc = "Move selection up" })
keymap.set("v", "A-j", "<cmd>m '<+1<CR>gv=gv", { desc = "Move selection down" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<Esc>", function()
	utils.close_floating_windows()
	if bo.modifiable then
		utils.clear_lsp_references()
	else
		return feedkeys("<C-w>c")
	end
end, { desc = "Close window if not modifiable, otherwise clear LSP references" })

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to prev tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %", { desc = "Open current buffer in a new tab" })
