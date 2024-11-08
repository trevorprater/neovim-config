require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>gc", ':lua require("functions").generate_commit_message()<CR>', { noremap = true, silent = true })
