-- LSP server configuration (runs at startup)
local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("clangd",   { capabilities = capabilities })
vim.lsp.config("pyright",  { capabilities = capabilities })
vim.lsp.config("html",     { capabilities = capabilities })
vim.lsp.config("cssls",    { capabilities = capabilities })
vim.lsp.config("jdtls",    { capabilities = capabilities })
vim.lsp.config("vimls",    { capabilities = capabilities })
vim.lsp.config("bashls",   { capabilities = capabilities })
vim.lsp.config("lua_ls",   {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable({
  "clangd", "pyright", "html", "cssls",
  "jdtls", "vimls", "bashls", "lua_ls",
})

-- Plugin spec returned to Lazy.nvim
return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "pyright",
        "html-lsp",
        "css-lsp",
        "jdtls",
        "vim-language-server",
        "bash-language-server",
        "lua-language-server",
      },
    },
  },
}
