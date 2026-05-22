return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = { "c", "lua", "vim", "bash", "python" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
