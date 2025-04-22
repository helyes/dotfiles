require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.clipboard = ""

o.relativenumber = true

-- to show end of line and dots on space
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "trail:⋅"
vim.opt.listchars:append "lead:⋅"
