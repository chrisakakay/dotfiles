return {
  'chrisakakay/spm.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    require('spm').setup({
      projects = {
        { name = "fusion-frontend", path = "D:/CODE/WORK/fusion-frontend" },
        { name = "dotfiles", path = "D:/CODE/NOTWORK/dotfiles" },
      }
    })

    vim.keymap.set("n", "<leader>pp", ":SPM<CR>", { desc = "Open project manager" })
  end,
}
