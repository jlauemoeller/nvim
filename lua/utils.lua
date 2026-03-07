-- borrows heavily from https://github.com/mawkler/nvim/blob/fc218645433f03995916f9e1c032bda7956fcb6e/lua/utils.lua

local M = {}

M.termcodes = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.feedkeys = function(keys, mode)
	if mode == nil then
		mode = "in"
	end
	return vim.api.nvim_feedkeys(M.termcodes(keys), mode, true)
end

local function lsp_server_has_references()
	for _, client in pairs(vim.lsp.get_clients()) do
		if client.server_capabilities then
			return true
		end
	end
	return false
end

--- Gets the buffer number of every visible buffer
--- @return integer[]
M.visible_buffers = function()
	return vim.tbl_map(vim.api.nvim_win_get_buf, vim.api.nvim_list_wins())
end

-- Clear all highlighted LSP references in all windows
M.clear_lsp_references = function()
	vim.cmd("nohlsearch")
	if lsp_server_has_references() then
		vim.lsp.buf.clear_references()
		for _, buffer in pairs(M.visible_buffers()) do
			vim.lsp.util.buf_clear_references(buffer)
		end
	end
end
-- Close every floating window
M.close_floating_windows = function()
	for _, win in pairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative == "win" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

-- Require `plugin` and call `plugin.setup()`
M.plugin_setup = function(plugin, setup)
	import(plugin, function(module)
		module.setup(setup)
	end)
end

return M
