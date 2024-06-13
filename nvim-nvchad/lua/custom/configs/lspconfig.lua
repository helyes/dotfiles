local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--

-- CUSTOM SETUPS
--
-- https://github.com/bash-lsp/bash-language-server#neovim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
lspconfig["bashls"].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|justfile)"
    }
}


-- lspconfig.pyright.setup { blabla}
