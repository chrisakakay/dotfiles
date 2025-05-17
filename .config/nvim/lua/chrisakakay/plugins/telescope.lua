return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    -- "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { shorten = 15 },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        },
        file_ignore_patterns = { ".git", ".cache", "node_modules", "dist" },
      }
    })

    -- telescope.load_extension("fzf")

    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find files in cwd" })
    vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Find recent files" })
    vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<cr>", { desc = "Find string in cwd", })
    vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "Find string under cursor" })
  end
}
