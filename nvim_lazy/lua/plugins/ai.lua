-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = "/Users/andras/.local/share/mise/installs/node/20.19.0/bin/node",
    },
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = true,
    cmd = { "CodeCompanion" },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
      },
    },
  },
}
