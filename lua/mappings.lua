require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "LSP diagnostic info" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
