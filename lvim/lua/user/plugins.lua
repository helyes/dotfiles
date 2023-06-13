-- Additional lvim plugins
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      -- vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
      -- vim.api.nvim_set_keymap("n", "SS", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
    {
     "nvim-treesitter/playground",
     commit = "4044b53c4d4fcd", -- need this specific commit as newer ones use treesitter.compat
     event = "BufRead",
    },
    {
      'stevearc/oil.nvim',
      config = function() require('oil').setup() end
    },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
  },
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  -- AI
  -- jackmort depends on nui
  "MunifTanjim/nui.nvim",
  "jackMort/ChatGPT.nvim",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "helyes/havanadark",
    dir = "/Users/andras/work/helyes/vim/plugins/havanadark.nvim",
    config = function()
      vim.g.havanadark_italic_comments = true
      vim.g.havanadark_italic_conditionals = true
    end
  },

  {
    -- nord colorscheme
    "shaunsingh/nord.nvim",
    "folke/tokyonight.nvim",
    "catppuccin/nvim",
    "rebelot/kanagawa.nvim"
  }
}

