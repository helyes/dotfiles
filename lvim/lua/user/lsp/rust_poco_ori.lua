-- https://github.com/pojokcodeid/lunarvim-config-manual/blob/main/config_rust.lua
-- https://www.youtube.com/watch?v=9oEXy6PjnDE&list=WL&index=49
-- start general pojok code
local on_save = true
local options = {
  -- backspace lvim default: indent,eol,start
  -- backspace = vim.opt.backspace + { "nostop" }, -- Don't stop backspace at insert
  -- clipboard = "unnamedplus", -- Connection to the system clipboard
  -- cmdheight lvim default: 1 --  -- more space in the neovim command line for displaying messages
  -- cmdheight = 0, -- hide command line unless needed
  -- same as default  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
  copyindent = true, -- Copy the previous indentation on autoindenting
  -- not needed, set somewhere else cursorline = true, -- Highlight the text line of the cursor
  -- same as default expandtab = true, -- Enable the use of space in tab
  -- same as default fileencoding = "utf-8", -- File content encoding for the buffer
  fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
  -- default is 10000, no need to change history = 100, -- Number of commands to remember in a history table
  -- same as default ignorecase = true, -- Case insensitive searching
  -- same as defult laststatus = 3, -- globalstatus
  lazyredraw = true, -- lazily redraw screen
  -- same as default mouse = "a", -- Enable mouse support
  -- same as default number = true, -- Show numberline
  -- same as default preserveindent = true, -- Preserve indent structure as much as possible
  -- same as default pumheight = 10, -- Height of the pop up menu
  -- same as default relativenumber = true, -- Show relative numberline
  -- same as default scrolloff = 8, -- Number of lines to keep above and below the cursor
  -- same as default shiftwidth = 2, -- Number of space inserted for indentation
  showmode = false, -- Disable showing modes in command line
  -- same as default showtabline = 2, -- always display tabline
  -- same as default sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
  -- same as default signcolumn = "yes", -- Always show the sign column
  -- same as default smartcase = true, -- Case sensitivie searching
  -- same as default splitbelow = true, -- Splitting a new window below the current one
  -- same as default splitright = true, -- Splitting a new window at the right of the current one
  -- same as default swapfile = false, -- Disable use of swapfile for the buffer
  -- same as default tabstop = 2, -- Number of space in a tab
  -- same as default termguicolors = true, -- Enable 24-bit RGB color in the TUI
  timeoutlen = 300, -- Length of time to wait for a mapped sequence -- default: 200
  -- same as default undofile = true, -- Enable persistent undo
  updatetime = 300, -- this many milliseconds nothing is typed the swap file will be written to disk
  wrap = true, -- Disable wrapping of lines longer than the width of window
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- minimal number of screen columns either side of cursor if wrap is `false`
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
  guifont = "Source_Code_Pro:h17", -- the font used in graphical neovim applications
  -- not needed, using defaults whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
-- add by pojok code
lvim.leader = "space"
lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<A-j>"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["<A-Down>"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["<A-k>"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<A-Up>"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<S-Down>"] = ":'<,'>t'><cr>"

lvim.keys.insert_mode["<S-Down>"] = "<cmd>t.<cr>"
lvim.keys.insert_mode["<S-Up>"] = "<cmd>t -1<cr>"
lvim.keys.insert_mode["<M-Down>"] = "<cmd>m+<cr>"
lvim.keys.insert_mode["<M-Up>"] = "<cmd>m-2<cr>"
lvim.keys.insert_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.insert_mode["<C-l>"] = "<cmd>LiveServer start<cr>"
lvim.keys.normal_mode["<S-Down>"] = "<cmd>t.<cr>"
lvim.keys.normal_mode["<S-Up>"] = "<cmd>t -1<cr>"
lvim.keys.normal_mode["<M-J>"] = "<cmd>t.<cr>"
lvim.keys.normal_mode["<M-K>"] = "<cmd>t -1<cr>"
lvim.keys.normal_mode["<M-Down>"] = "<cmd>m+<cr>"
lvim.keys.normal_mode["<M-Up>"] = "<cmd>m-2<cr>"
lvim.keys.normal_mode["<M-j>"] = "<cmd>m+<cr>"
lvim.keys.normal_mode["<M-k>"] = "<cmd>m-2<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.normal_mode["q"] = "<cmd>q<cr>"

lvim.builtin.alpha.dashboard.section.header.val = {
  [[             _       _                    _      ]],
  [[ _ __   ___ (_) ___ | | __   ___ ___   __| | ___ ]],
  [[| '_ \ / _ \| |/ _ \| |/ /  / __/ _ \ / _` |/ _ \]],
  [[| |_) | (_) | | (_) |   <  | (_| (_) | (_| |  __/]],
  [[| .__/ \___// |\___/|_|\_\  \___\___/ \__,_|\___|]],
  [[|_|       |__/                                   ]],
}
local function footer()
  return "Pojok Code"
end
lvim.builtin.alpha.dashboard.section.footer.val = footer()

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetype = { "lua" } },
  { command = "rustfmt" },
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "rust",
  "toml",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
local codelldb_adapter = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_path .. "bin/codelldb",
    args = { "--port", "${port}" },
    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

pcall(function()
  require("rust-tools").setup {
    tools = {
      executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
      reload_workspace_from_cargo_toml = true,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = false,
        parameter_hints_prefix = "<-",
        other_hints_prefix = " =>",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
      hover_actions = {
        border = "rounded",
      },
      on_initialized = function()
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
          pattern = { "*.rs" },
          callback = function()
            local _, _ = pcall(vim.lsp.codelens.refresh)
          end,
        })
      end,
    },
    dap = {
      adapter = codelldb_adapter,
    },
    server = {
      on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        local rt = require "rust-tools"
        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      end,

      capabilities = require("lvim.lsp").common_capabilities(),
      settings = {
        ["rust-analyzer"] = {
          lens = {
            enable = true,
          },
          checkOnSave = {
            enable = true,
            command = "clippy",
          },
        },
      },
    },
  }
end)

lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = codelldb_adapter
  dap.configurations.rust = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end

vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })

lvim.builtin.which_key.mappings["C"] = {
  name = "Rust",
  r = { "<cmd>RustRunnables<Cr>", "Runnables" },
  t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
  m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
  c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
  p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
  d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
  v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
  R = {
    "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
    "Reload Workspace",
  },
  o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
  y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
  P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
  i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
  f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
  D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
}


  table.insert(lvim.plugins, { "simrat39/rust-tools.nvim", event = "VeryLazy" })
  table.insert(lvim.plugins, 
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  })

  table.insert(lvim.plugins, 
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
      require("fidget").setup()
    end,
  })



  -- {
  --   "saecki/crates.nvim",
  --   version = "v0.3.0",
  --   event = "VeryLazy",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("crates").setup {
  --       null_ls = {
  --         enabled = true,
  --         name = "crates.nvim",
  --       },
  --       popup = {
  --         border = "rounded",
  --       },
  --     }
  --   end,
  -- },
--   {
--     "j-hui/fidget.nvim",
--     event = "VeryLazy",
--     config = function()
--       require("fidget").setup()
--     end,
--   },
-- }


-- /Users/andras/.local/share/lunarvim/lvim/utils/ci/generate_new_lockfile.lua
    table.insert(lvim.plugins, {
  -- depends on plenary
      "sindrets/diffview.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    })
