require("chrisakakay.options")
require("chrisakakay.keymaps")


-- fix for startup issue
local termfeatures = vim.g.termfeatures or {}
termfeatures.osc52 = false
vim.g.termfeatures = termfeatures


-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath ,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = "chrisakakay.lazy",
  install = { colorscheme = { "nightfly" } },
  checker = { enabled = true, notify = false },
  change_detection = { enabled = true, notify = true },
})


-- after lazy setup
vim.cmd.colorscheme "catppuccin-mocha"

vim.lsp.config["zls"] = {
  cmd = { "zls" },
  filetypes = { "zig" },
  root_markers = { 'build.zig' },
  single_file_support = true,
}
vim.lsp.enable('zls')
