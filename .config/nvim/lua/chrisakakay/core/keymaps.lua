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

-- project management
keymap.set("n", "<leader>pp", "<cmd>Ex<CR>", { desc = "Show file navigator" })
keymap.set("n", "<leader>pw", "<cmd>cd D:/CODE/WORK<CR> | <cmd>Ex<CR>", { desc = "Go to work projects" })
keymap.set("n", "<leader>pn", "<cmd>cd D:/CODE/NOTWORK<CR> | <cmd>Ex<CR>", { desc = "Go to notwork projects" })
