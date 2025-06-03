-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig
  -- disabling virtual text due to lsp_lines
  -- see keymaps.lua for toggle function
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        virtual_text = false,
      },
    },
  },
}

