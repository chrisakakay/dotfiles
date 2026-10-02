return {
  "akinsho/bufferline.nvim",
  dependencies = {
    -- "nvim-tree/nvim-web-devicons"
  },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "thick",
      indicator = {
        style = "none"
      },

      buffer_close_icon = 'x',
      modified_icon = '● ',
      close_icon = 'x ',
      left_trunc_marker = ' ',
      right_trunc_marker = ' ',

      color_icons = false,
      show_buffer_icons = false,
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
}
