return {
  'chrisakakay/spm.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    require('spm').setup({
      projects = {
        { name = "dotfiles", path = "D:/CODE/NOTWORK/dotfiles" },
        { name = "fusion-frontend", path = "D:/CODE/WORK/fusion-frontend" },
        { name = "interpreter-zig", path = "D:/CODE/NOTWORK/codecrafters/codecrafters-interpreter-zig" },
        { name = "nvimconfig", path = os.getenv("LOCALAPPDATA") .. "/nvim" },
        { name = "spm.nvim", path = "D:/CODE/NOTWORK/spm.nvim" },
        { name = "zig-game-proto", path = "D:/CODE/NOTWORK/zig-game-proto" },
      }
    })

    vim.keymap.set("n", "<leader>pp", ":SPM<CR>", { desc = "Open project manager" })
  end,
}
