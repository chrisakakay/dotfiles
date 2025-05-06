return {
  'chrisakakay/spm.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    require('spm').setup({
      projects = {
        { name = "dotfiles", path = "D:/CODE/NOTWORK/dotfiles" },
        { name = "nvimconfig", path = os.getenv("LOCALAPPDATA") .. "/nvim" },
        { name = "spm.nvim", path = "D:/CODE/NOTWORK/spm.nvim" },
        { name = "fusion-frontend", path = "D:/CODE/WORK/fusion-frontend" },
      }
    })

    vim.keymap.set("n", "<leader>pp", ":SPM<CR>", { desc = "Open project manager" })
  end,
}
