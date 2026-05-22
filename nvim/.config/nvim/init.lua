vim.loader.enable() -- lua files get compiled once, and loaded from cache

require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")

-- KEYBINDINGS
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<leader>w", ":w<CR>")
-- vim.keymap.set("n", "<leader>q", ":q<CR>")
-- vim.keymap.set("n", "<Esc>", ":noh<CR>")
