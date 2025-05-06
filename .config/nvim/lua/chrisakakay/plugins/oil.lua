return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = {},
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
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
}
