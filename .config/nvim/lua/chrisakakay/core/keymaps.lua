vim.g.mapleader = " "

local keymap = vim.keymap

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- move lines
keymap.set("n", "<C-S-Down>", ":m +1<CR>", { desc = "Move line down" })
keymap.set("n", "<C-S-Up>", ":m -2<CR>", { desc = "Move line up" })

-- project management
-- keymap.set("n", "<leader>pp", "<cmd>Ex<CR>", { desc = "Show file navigator" })

local nore = { noremap = true, silent = true }

-- windows style keybinds
keymap.set("n", "<C-s>", ":w<Enter>", nore)
keymap.set("i", "<C-s>", "<Esc>:w<CR>a", nore)

keymap.set("n", "<C-x>", ":wq<Enter>", nore)
keymap.set("i", "<C-x>", "<Esc>:wq<Enter>", nore)

keymap.set("n", "<S-Left>", "v<Left>", nore)
keymap.set("n", "<S-Right>", "v<Right>", nore)

keymap.set("v", "<C-c>", '"+y', nore)
keymap.set("v", "<C-v>", '"+p', nore)
