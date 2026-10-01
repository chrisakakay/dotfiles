return {
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Auto brackets closing
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- Auto remove trailing spaces
  { "cappyzawa/trim.nvim", opts = {} },

  -- Git signs
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" } },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      --'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end,
  },

  -- File explorer
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {},
    config = function()
      require('oil').setup({
        default_file_explorer = true,
        delete_to_trash = true,
        columns = {
          "icon",
          -- "permissions",
          "size",
          -- "mtime",
        },
        view_options = {
          show_hidden = true,
          natural_order = true,
          --is_always_hidden = function(name, _)
          --  return name == '..' or name == '.git'
          --end,
        },
        win_options = {
          wrap = true
        }
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<Space>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory as floating window" })
    end,
    lazy = false,
  },

  -- Autocomplete
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      keymap = { preset = 'enter' }, -- 'enter' for enter to accept
      appearance = { nerd_font_variant = 'mono' },
    },
  },
}
