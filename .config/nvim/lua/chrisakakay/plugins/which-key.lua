return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    preset = "helix",
    icons = {
      mappings = false,
      colors = false,
      rules = {},

      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = ">", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "..",

      keys = {
        Up = "Up ",
        Down = "Down ",
        Left = "Left ",
        Right = "Right ",
        C = "C ",
        M = "M ",
        D = "D ",
        S = "S ",
        CR = "CR ",
        Esc = "ESC ",
        ScrollWheelDown = "SDown ",
        ScrollWheelUp = "SUp ",
        NL = "NL ",
        BS = "BS",
        Space = "SPC ",
        Tab = "TAB ",
        F1 = "F1",
        F2 = "F2",
        F3 = "F3",
        F4 = "F4",
        F5 = "F5",
        F6 = "F6",
        F7 = "F7",
        F8 = "F8",
        F9 = "F9",
        F10 = "F10",
        F11 = "F11",
        F12 = "F12",
      },
    },
  },
}
