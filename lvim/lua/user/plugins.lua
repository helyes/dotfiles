-- Additional lvim plugins
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "SS", ":HopWord<cr>", { silent = true })
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

print('plugins.lua loaded')
