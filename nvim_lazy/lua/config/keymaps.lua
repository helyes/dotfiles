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

-- alacritty does not handle extended key events well
-- https://github.com/neovim/neovim/issues/31282#issuecomment-2489733089
-- https://www.reddit.com/r/neovim/comments/1bh3wkv/some_neovim_keybindings_not_working_properly_when/
map({ "n", "t" }, "<M-/>", "<C-/>", { remap = true })

