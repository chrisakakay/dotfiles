require("chrisakakay.options")
require("chrisakakay.keymaps")
require("chrisakakay.plugins")
require("chrisakakay.lsp")

-- fix for startup issue
local termfeatures = vim.g.termfeatures or {}
termfeatures.osc52 = false
vim.g.termfeatures = termfeatures
