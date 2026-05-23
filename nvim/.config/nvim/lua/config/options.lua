local opt = vim.opt 

-- Leaders
vim.g.mapleader = " "

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation: 2 spaces, yes tabs :)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true -- what does this do?

-- Smart search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Interface 
opt.signcolumn = "yes" -- like the git diagnostics, git signs, breakpoints
opt.cursorline = true
opt.termguicolors = true
opt.showmode = true
opt.winblend = 10 -- transparency level (0,100) for floating windows
opt.pumblend = 10 -- transparency level (0,100) for the completion pop up menu

-- System clipboard
opt.clipboard = "unnamedplus" -- copy/paste operations work systemwide on same clipboard

-- Persistent undo, no swap
opt.undofile = true
opt.swapfile = false

-- Invisible characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
