require "nvchad.mappings"
require "overrides.mappings"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- telescope
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "telescope keymaps" })
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "telescope resume/last search" })
map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "telescope search selected string" })
-- local nomap = vim.keymap.del
-- nomap("n", "<leader>b")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- TOGGLE (u)--
-- git
map("n", "<leader>ugb", "<CMD>Gitsigns toggle_current_line_blame<CR>", { desc = "toggle git current line blame" })
map("n", "<leader>ugw", "<CMD>Gitsigns toggle_word_diff<CR>", { desc = "toggle git word diff" })
map("n", "<leader>ugl", "<CMD>Gitsigns toggle_linehl<CR>", { desc = "toggle git line highlight" })
map("n", "<leader>ugn", "<CMD>Gitsigns toggle_numhl<CR>", { desc = "toggle git num highlight" })
map("n", "<leader>ugd", "<CMD>Gitsigns toggle_deleted<CR>", { desc = "toggle git deleted" })

