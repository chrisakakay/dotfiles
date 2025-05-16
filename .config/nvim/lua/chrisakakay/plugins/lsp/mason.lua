return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "￫",
          package_uninstalled = "×",
        }
      }
    })

    mason_lspconfig.setup({
      automatic_enable = true,
      ensure_installed = {
        "cssls",
        "html",
        "lua_ls",
        "zls", --zig
      },
    })
  end
}
