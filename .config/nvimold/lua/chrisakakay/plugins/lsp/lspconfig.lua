return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = ev.buf, desc = desc, silent = true })
        end

        map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP") -- mapping to restart lsp if necessary
        map("n", "<leader>rr", vim.lsp.buf.rename, "Smart rename") -- smart rename
        map("n", "<leader>rD", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics") -- show  diagnostics for file
        map("n", "<leader>rd", vim.diagnostic.open_float, "Show line diagnostics") -- show diagnostics for line
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

    local signs = {
      [vim.diagnostic.severity.ERROR] = "E ",
      [vim.diagnostic.severity.WARN]  = "W ",
      [vim.diagnostic.severity.HINT]  = "H ",
      [vim.diagnostic.severity.INFO]  = "I ",
    }
    vim.diagnostic.config({
      signs = {
        text = signs -- Enable signs in the gutter
      },
      virtual_text = true,  -- Specify Enable virtual text for diagnostics
      underline = true,     -- Specify Underline diagnostics
      update_in_insert = false,  -- Keep diagnostics active in insert mode
    })

    --local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    --lspconfig.lua_ls.setup({
    --  capabilities = capabilities,
    --  settings = {
    --    Lua = {
    --      -- make the language server recognize "vim" global
    --      diagnostics = {
    --        globals = { "vim" },
    --      },
    --      completion = {
    --        callSnippet = "Replace",
    --      },
    --    },
    --  },
    --})

    --lspconfig.cssls.setup({ capabilities = capabilities })
    --lspconfig.html.setup({ capabilities = capabilities })
    --lspconfig.zls.setup({ capabilities = capabilities })

    vim.lsp.config("cssls", { capabilities = capabilities })
    vim.lsp.config("html", { capabilities = capabilities })
    vim.lsp.config("zls", { capabilities = capabilities })

    vim.lsp.enable({"cssls"})
    vim.lsp.enable({"html"})
    vim.lsp.enable({"zls"})
  end
}
