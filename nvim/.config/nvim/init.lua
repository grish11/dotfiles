vim.loader.enable() -- lua files get compiled once, and loaded from cache


require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")

<<<<<<< Updated upstream

-- C# configs

-- local pid = vim.fn.getpid()
--
-- local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
--
-- require'lspconfig'.omnisharp.setup{
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) }
--     -- Additional configuration can be added here
-- }
--

-- KEYBINDINGS
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<Esc>", ":noh<CR>")
=======
>>>>>>> Stashed changes












































--
-- -- PLUGINS
-- require("lazy").setup({
--   {
--     "nyoom-engineering/oxocarbon.nvim",
--     priority = 1000,
--     config = function()
--       vim.opt.background = "dark"
--       vim.cmd("colorscheme oxocarbon")
--     end,
--   },
--   {
--     "nvim-telescope/telescope.nvim",
--     branch = "0.1.x",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     keys = {
--       { "<leader>ff", "<cmd>Telescope find_files<cr>" },
--       { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
--     },
--   },
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     event = { "BufReadPost", "BufNewFile" },
--     config = function()
--       require("nvim-treesitter.config").setup({
--         ensure_installed = { "c", "lua", "vim", "bash", "python" },
--         highlight = { enable = true },
--         indent = { enable = true },
--       })
--     end,
--   },
-- })
--
-- -- KEYBINDINGS
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<leader>w", ":w<CR>")
-- vim.keymap.set("n", "<leader>q", ":q<CR>")
-- vim.keymap.set("n", "<Esc>", ":noh<CR>")

