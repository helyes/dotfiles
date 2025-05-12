-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>sP", "<cmd>silent !tmux new-window tmsp.sh<cr>", { desc = "Search project" })

map("n", "<leader>bf", ":let @* = trim(execute(\"echo expand('%:p')\"))<cr>", { desc = "Filepath to clipboard" })
map(
  "n",
  "<leader>bF",
  ":call setreg('*', expand('%:.') .. ':' .. line('.'))<cr>",
  { desc = "Filepath:no to clipboard" }
)

map("n", "<leader>xi", "<cmd>lua require('config.lsp_lines').toggle()<cr>", { desc = "Toggle lsp_lines" })

map("n", "<leader>o", "<cmd>Oil --float<cr>", { desc = "Oil ./" })
map("n", "<leader>O", "<cmd>Oil --float .<cr>", { desc = "Oil (root dir)" })

-- https://github.com/prdanelli/dotfiles/blob/main/neovim/lua/config/options.lua
-- -- Ensure I dont freak out by hitting the cap w when exiting
-- vim.cmd([[
--   cnoreabbrev Wq wq
--   cnoreabbrev wQ wq
--   cnoreabbrev WQ wq
--   cnoreabbrev W w
--   cnoreabbrev Q q
-- ]])