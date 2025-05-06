return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = ev.buf, desc = desc, silent = true })
        end

        map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP") -- mapping to restart lsp if necessary
        map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename") -- smart rename
        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics") -- show  diagnostics for file
        map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics") -- show diagnostics for line
        map("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor") -- show documentation for what is under cursor

        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration") -- go to declaration
        map("n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references") -- show definition, references
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions") -- show lsp definitions
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations") -- show lsp implementations
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions") -- show lsp type definitions

        -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions") -- see available code actions, in visual mode will apply to selection

        -- map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic") -- jump to previous diagnostic in buffer
        -- map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic") -- jump to next diagnostic in buffer
      end
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "javascriptreact", "css", "sass", "scss", "less" },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })

  end
}
