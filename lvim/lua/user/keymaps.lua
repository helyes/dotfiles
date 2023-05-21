-- keymappings [view all the defaults by pressing <leader>Lk]
-- lvim.leader = "space"
-- add your own keymapping
--lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- lvim.keys.normal_mode["<leader>xr"] = "<cmd>lua AHRA('havanadark')<cr>"

-- yanking with leader copies to "
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/after/plugin/keymap/init.lua
-- vim.keymap.set("n", "<leader>y", "\"+y", { noremap = true })
-- vim.keymap.set("v", "<leader>y", "\"+y", { noremap = true })
-- vim.keymap.set("n", "<leader>Y", "\"+Y", { noremap = true })

lvim.keys.normal_mode["[e"] = "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>"
lvim.keys.normal_mode["]e"] = "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>"
lvim.keys.normal_mode["]l"] = "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>"

lvim.keys.normal_mode["<leader>bp"] = ":echo expand('%:p')<cr> " -- print full file name (path)
lvim.keys.normal_mode["<leader>bP"] = ":let @* = trim(execute(\"echo expand('%:p')\"))<cr>"
lvim.keys.normal_mode["<leader>sP"] = "<cmd>silent !tmux new-window tmsp.sh<cr>"

