-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.opt.relativenumber = true

vim.cmd[[
augroup highlight_yank
autocmd!
" au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=200})
augroup END
]]
