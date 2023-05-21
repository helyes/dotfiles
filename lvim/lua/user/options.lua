-- lvim.builtin.alpha.dashboard.section.header.val = {
--   "    __                          _    ___         ",
--   "   / /   __  ______  ____ _____| |  / (_)___ ___ ",
--   "  / /   / / / / __ \\/ __ `/ ___/ | / / / __ `__ \\",
--   " / /___/ /_/ / / / / /_/ / /   | |/ / / / / / / /",
--   "/_____/\\__,_/_/ /_/\\__,_/_/    |___/_/_/ /_/ /_/ ",
-- }

local function footer()
  return "Andras's lvim \n" .. require("lvim.utils.git").get_lvim_version()
end
lvim.builtin.alpha.dashboard.section.footer.val = footer()




-- Check opton value: verbose set copyindent?
-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
-- lvim.use_icons = false -- to disable icons and use a minimalist setup, uncomment the following

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- TODO: User Config for predefined plugins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Andras
vim.opt.showmode = true
vim.opt.relativenumber = true
vim.opt.clipboard = ""

-- to show end of line and dots on space
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "trail:⋅"
vim.opt.listchars:append "lead:⋅"
-- vim.opt.listchars:append "space:⋅"

vim.opt.termguicolors = true

vim.opt.timeoutlen=200
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]


