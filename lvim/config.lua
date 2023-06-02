-- reload defined here: /Users/andras/.local/share/lunarvim/lvim/lua/lvim/utils/modules.lua
require("user.globals")
require("user.helpers")

reload("user.plugins")
reload("user.options")
reload("user.keymaps")


reload("user.crates")
reload("user.fidget")
reload("user.treesitter")
-- leave it last
reload "user.whichkey"

reload "user.lsp.dockerls"

--[[

lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- -- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "bash",
--   "c",
--   "javascript",
--   "json",
--   "lua",
--   "python",
--   "typescript",
--   "tsx",
--   "css",
--   "rust",
--   "java",
--   "yaml",
-- }

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck"
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- -- Andras
-- vim.opt.showmode = true
-- vim.opt.relativenumber = true
-- vim.opt.clipboard = ""

-- -- to show end of line and dots on space
-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append "trail:⋅"
-- vim.opt.listchars:append "lead:⋅"
-- -- vim.opt.listchars:append "space:⋅"

-- vim.opt.termguicolors = true

-- vim.opt.timeoutlen=200
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]


-- lvim.keys.normal_mode["<leader>xr"] = "<cmd>lua AHRA('havanadark')<cr>"

-- yanking with leader copies to "
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/after/plugin/keymap/init.lua
-- vim.keymap.set("n", "<leader>y", "\"+y", { noremap = true })
-- vim.keymap.set("v", "<leader>y", "\"+y", { noremap = true })
-- vim.keymap.set("n", "<leader>Y", "\"+Y", { noremap = true })

-- lvim.keys.normal_mode["[e"] = "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>"
-- lvim.keys.normal_mode["]e"] = "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>"
-- lvim.keys.normal_mode["]l"] = "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>"

-- lvim.keys.normal_mode["<leader>bp"] = ":echo expand('%:p')<cr> " -- print full file name (path)
-- lvim.keys.normal_mode["<leader>bP"] = ":let @* = trim(execute(\"echo expand('%:p')\"))<cr>"
-- lvim.keys.normal_mode["<leader>sP"] = "<cmd>silent !tmux new-window tmsp.sh<cr>"
-- -- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- vim.api.nvim_command([[
--     augroup ChangeBackgroudColour
--         autocmd colorscheme * :hi normal guibg=#0a0a0a
--     augroup END
-- ]])

-- vim.api.nvim_command([[
--     augroup ChangeBackgroudColour
--         autocmd colorscheme * :hi normal guibg=NONE
--     augroup END
-- ]])

-- RUST: https://github.com/ChristianChiarulli/lvim/blob/master/lua/user/lsp/languages/rust.lua
-- https://sharksforarms.dev/posts/neovim-rust

-- " Convenient command to see the difference between the current buffer and the
-- " file it was loaded from, thus the changes you made.
-- if !exists(":DiffOrig")
--   command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
--           \ | wincmd p | diffthis
-- endif
--
--
--
--
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


-- require('user.lsp.rust_poco')
