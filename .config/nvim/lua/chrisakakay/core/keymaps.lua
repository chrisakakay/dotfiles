vim.g.mapleader = " "

local keymap = vim.keymap
local nore = { noremap = true, silent = true }

-- window and tab management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal" })

--[[
keymap.set("n", "<leader>wto", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>wtx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>wtn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>wtp", ":tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>wtf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })
]]

-- windows style keybinds
keymap.set("n", "<C-s>", ":w<Enter>", nore)
keymap.set("i", "<C-s>", "<Esc>:w<CR>a", nore)

keymap.set("n", "<C-x>", ":wq<Enter>", nore)
keymap.set("i", "<C-x>", "<Esc>:wq<Enter>", nore)

keymap.set("n", "<S-Left>", "v<Left>", nore)
keymap.set("n", "<S-Right>", "v<Right>", nore)

keymap.set("v", "<C-c>", '"+y', nore)
keymap.set("v", "<C-v>", '"+p', nore)

keymap.set("n", "<C-S-Down>", ":m +1<CR>", { desc = "Move line down" })
keymap.set("n", "<C-S-Up>", ":m -2<CR>", { desc = "Move line up" })
