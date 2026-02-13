vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- line numbers and cursor
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- tabs & indentation
opt.tabstop = 2 
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true


opt.signcolumn = "yes"
opt.termguicolors = true
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- window splits
opt.splitright = true
opt.splitbelow = true



